" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
autoload/escapings.vim	[[[1
195
" escapings.vim: Common escapings of filenames, and wrappers around new Vim 7.2
" fnameescape() and shellescape() functions. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS 
"	007	27-May-2009	escapings#bufnameescape() now automatically
"				expands a:filespec to the required full absolute
"				filespec in the (default) full match mode. 
"				BF: ',' must not be escaped in
"				escapings#bufnameescape(); it only has special
"				meaning inside { }, which never occurs in the
"				escaped pattern. 
"	006	26-May-2009	escapings#fnameescape() emulation part now works
"				like fnameescape() on Windows: Instead of
"				converting backslashes to forward slashes, they
"				are not escaped. (But on non-Windows systems,
"				they are.) 
"				Added and refined escapings#fnameunescape() from
"				dropquery.vim. 
"	005	02-Mar-2009	Now explicitly checking for the new escape
"				functions instead of assuming they're in Vim 7.2
"				so that users of a patched Vim 7.1 also get the
"				benefit of them. 
"	004	25-Feb-2009	Now using character list from ':help
"				fnameescape()' (plus converting \ to /). 
"	003	17-Feb-2009	Added optional a:isFullMatch argument to
"				escapings#bufnameescape(). 
"				Cleaned up documentation. 
"	002	05-Feb-2009	Added improved version of escapings#exescape()
"				that relies on fnameescape() to properly escape
"				all special Ex characters. 
"	001	05-Jan-2009	file creation

function! s:IsWindowsLike()
    return has('dos16') || has('dos32') || has('win95') || has('win32') || has('win64')
endfunction

function! escapings#bufnameescape( filespec, ... )
"*******************************************************************************
"* PURPOSE:
"   Escape a normal filespec syntax so that it can be used for the bufname(),
"   bufnr(), bufwinnr(), ... commands. 
"   Ensure that there are no double (back-/forward) slashes inside the path; the
"   anchored pattern doesn't match in those cases! 
"
"* ASSUMPTIONS / PRECONDITIONS:
"	? List of any external variable, control, or other element whose state affects this procedure.
"* EFFECTS / POSTCONDITIONS:
"	? List of the procedure's effect on each external variable, control, or other element.
"* INPUTS:
"   a:filespec	    normal filespec
"   a:isFullMatch   Optional flag whether only the full filespec should be
"		    matched (default=1). If 0, the escaped filespec will not be
"		    anchored. 
"* RETURN VALUES: 
"   Filespec escaped for the buf...() commands. 
"*******************************************************************************
    let l:isFullMatch = (a:0 ? a:1 : 1)

    " For a full match, the passed a:filespec must be converted to a full
    " absolute path (with symlinks resolved, just like Vim does on opening a
    " file) in order to match. 
    let l:escapedFilespec = (l:isFullMatch ? resolve(fnamemodify(a:filespec, ':p')) : a:filespec)

    " Backslashes are converted to forward slashes, as the comparison is done with
    " these on all platforms, anyway (cp. :help file-pattern). 
    let l:escapedFilespec = tr(l:escapedFilespec, '\', '/')

    " Special file-pattern characters must be escaped: [ escapes to [[], not \[.
    let l:escapedFilespec = substitute(l:escapedFilespec, '[\[\]]', '[\0]', 'g')

    " The special filenames '#' and '%' need not be escaped when they are anchored
    " or occur within a longer filespec. 
    let l:escapedFilespec = escape(l:escapedFilespec, '?*')

    " I didn't find any working escaping for {, so it is replaced with the ?
    " wildcard. 
    let l:escapedFilespec = substitute(l:escapedFilespec, '[{}]', '?', 'g')

    if l:isFullMatch
	" The filespec must be anchored to ^ and $ to avoid matching filespec
	" fragments. 
	return '^' . l:escapedFilespec . '$'
    else
	return l:escapedFilespec
    endif
endfunction

function! escapings#exescape( command )
"*******************************************************************************
"* PURPOSE:
"   Escape a shell command (potentially consisting of multiple commands and
"   including (already quoted) command-line arguments) so that it can be used in
"   ex commands. For example: 'hostname && ps -ef | grep -e "foo"'. 
"
"* ASSUMPTIONS / PRECONDITIONS:
"	? List of any external variable, control, or other element whose state affects this procedure.
"* EFFECTS / POSTCONDITIONS:
"	? List of the procedure's effect on each external variable, control, or other element.
"* INPUTS:
"   a:command	    Shell command-line. 
"
"* RETURN VALUES: 
"   Escaped shell command to be passed to the !{cmd} or :r !{cmd} commands. 
"*******************************************************************************
if exists('*fnameescape')
    return join(map(split(a:command, ' '), 'fnameescape(v:val)'), ' ')
else
    return escape(a:command, '\%#|' )
endif
endfunction

function! escapings#fnameescape( filespec )
"*******************************************************************************
"* PURPOSE:
"   Escape a normal filespec syntax so that it can be used in ex commands. 
"* ASSUMPTIONS / PRECONDITIONS:
"	? List of any external variable, control, or other element whose state affects this procedure.
"* EFFECTS / POSTCONDITIONS:
"	? List of the procedure's effect on each external variable, control, or other element.
"* INPUTS:
"   a:filespec	    normal filespec
"* RETURN VALUES: 
"   Escaped filespec to be passed as a {file} argument to an ex command. 
"*******************************************************************************
if exists('*fnameescape')
    return fnameescape(a:filespec)
else
    " Note: On Windows, backslash path separators mustn't be escaped. 
    return escape(a:filespec, " \t\n*?[{`$%#'\"|!<" . (s:IsWindowsLike() ? '' : '\'))
endif
endfunction

function! escapings#fnameunescape( exfilespec, ... )
"*******************************************************************************
"* PURPOSE:
"   Converts the passed a:exfilespec to the normal filespec syntax (i.e. no
"   escaping of ex special chars like [%#]). The normal syntax is required by
"   Vim functions such as filereadable(), because they do not understand the
"   escaping for ex commands. 
"   Note: On Windows, fnamemodify() doesn't convert path separators to
"   backslashes. We don't force that neither, as forward slashes work just as
"   well and there is even less potential for problems. 
"* ASSUMPTIONS / PRECONDITIONS:
"	? List of any external variable, control, or other element whose state affects this procedure.
"* EFFECTS / POSTCONDITIONS:
"	? List of the procedure's effect on each external variable, control, or other element.
"* INPUTS:
"   a:exfilespec    Escaped filespec to be passed as a {file} argument to an ex
"		    command.
"   a:isMakeFullPath	Flag whether the filespec should also be expanded to a
"			full path, or kept in whatever form it currently is. 
"* RETURN VALUES: 
"   Unescaped, normal filespec. 
"*******************************************************************************
    let l:isMakeFullPath = (a:0 > 0 ? a:1 : 0)
    return fnamemodify( a:exfilespec, ':gs+\\\([ \t\n*?[{`$%#''"|!<' . (s:IsWindowsLike() ? '' : '\') . ']\)+\1+' . (l:isMakeFullPath ? ':p' : ''))
endfunction

function! escapings#shellescape( filespec, ... )
"*******************************************************************************
"* PURPOSE:
"   Escape a normal filespec syntax so that it can be used in shell commands. 
"   The filespec will be quoted properly. 
"   When the {special} argument is present and it's a non-zero Number, then
"   special items such as "!", "%", "#" and "<cword>" will be preceded by a
"   backslash.  This backslash will be removed again by the |:!| command.
"
"* ASSUMPTIONS / PRECONDITIONS:
"	? List of any external variable, control, or other element whose state affects this procedure.
"* EFFECTS / POSTCONDITIONS:
"	? List of the procedure's effect on each external variable, control, or other element.
"* INPUTS:
"   a:filespec	    normal filespec
"   a:special	    Flag whether special items will be escaped, too. 
"
"* RETURN VALUES: 
"   Escaped filespec to be used in a :! command or inside a system() call. 
"*******************************************************************************
    let l:isSpecial = (a:0 > 0 ? a:1 : 0)
if exists('*shellescape')
    return shellescape(a:filespec, l:isSpecial)
else
    let l:escapedFilespec = (l:isSpecial ? escapings#fnameescape(a:filespec) : a:filespec)

    if s:IsWindowsLike()
	return '"' . l:escapedFilespec . '"'
    else
	return "'" . l:escapedFilespec . "'"
    endif
endif
endfunction

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
autoload/writebackup.vim	[[[1
218
" writebackup.vim: Write backups of current file with date file extension.  
"
" DEPENDENCIES:
"   - escapings.vim autoload script. 
"
" Copyright: (C) 2007-2009 by Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS 
"   2.10.005	27-May-2009	Replaced simple filespec escaping with
"				built-in fnameescape() function (or emulation
"				for Vim 7.0 / 7.1) via escapings.vim wrapper. 
"   2.00.004	22-Feb-2009	ENH: Added a:isForced argument to
"				writebackup#WriteBackup() to allow forcing via
"				:WriteBackup!. 
"   2.00.003	21-Feb-2009	ENH: No backup is written if there is an
"				identical previous backup. This requires the
"				writebackupVersionControl plugin and can be
"				configured via
"				g:WriteBackup_AvoidIdenticalBackups. 
"   2.00.002	18-Feb-2009	ENH: Disallowing backup of backup file if
"				writebackupVersionControl plugin is installed. 
"				BF: On Linux, if the backup directory doesn't
"				exist, the exception thrown in
"				writebackup#AdjustFilespecForBackupDir() does
"				not contain the absolute dirspec, because (on
"				Linux, not on Windows), the
"				fnamemodify(...,':p') call does not resolve to
"				an absolute filespec if the file doesn't exist.
"				(This is okay and mentioned in the help). 
"				Now keeping an intermediate variable l:dirspec
"				(that contains the absolute dirspec) instead of
"				trying to re-create the absolute missing
"				dirspec from l:adjustedDirspec. 
"   2.00.001	17-Feb-2009	Moved functions from plugin to separate autoload
"				script. 
"				Replaced global WriteBackup_...() functions with
"				autoload functions writebackup#...(). This is an
"				incompatible change that also requires the
"				corresponding writebackupVersionControl.vim
"				version. 
"				file creation

function! s:GetSettingFromScope( variableName, scopeList )
    for l:scope in a:scopeList
	let l:variable = l:scope . ':' . a:variableName
	if exists( l:variable )
	    execute 'return ' . l:variable
	endif
    endfor
    throw "No variable named '" . a:variableName . "' defined. "
endfunction

function! s:ExistsWriteBackupVersionControlPlugin()
    " Do not check for the plugin version of writebackupVersionControl here;
    " that plugin has the mandatory dependency to this plugin and will ensure
    " that the versions are compatible. 
    return exists('g:loaded_writebackupVersionControl') && g:loaded_writebackupVersionControl
endfunction

function! writebackup#GetBackupDir( originalFilespec, isQueryOnly )
    if empty(a:originalFilespec)
	throw 'WriteBackup: No file name'
    endif
    let l:BackupDir = s:GetSettingFromScope( 'WriteBackup_BackupDir', ['b', 'g'] )
    if type(l:BackupDir) == type('')
	return l:BackupDir
    else
	return call(l:BackupDir, [a:originalFilespec, a:isQueryOnly])
    endif
endfunction

function! writebackup#AdjustFilespecForBackupDir( originalFilespec, isQueryOnly )
    let l:backupDir = writebackup#GetBackupDir(a:originalFilespec, a:isQueryOnly)
    if l:backupDir == '.'
	" The backup will be placed in the same directory as the original file. 
	return a:originalFilespec
    endif

    let l:originalDirspec = fnamemodify( a:originalFilespec, ':p:h' )
    let l:originalFilename = fnamemodify( a:originalFilespec, ':t' )

    let l:adjustedDirspec = ''
    " Note: On Windows, fnamemodify( 'path/with/./', ':p' ) will convert the
    " forward slashes to backslashes by triggering a path simplification of the
    " '/./' part. On Unix, simplify() will get rid of the '/./' part. 
    if l:backupDir =~# '^\.\.\?[/\\]'
	" Backup directory is relative to original file. 
	let l:dirspec = simplify(fnamemodify( l:originalDirspec . '/' . l:backupDir . '/', ':p' ))

	" Modify dirspec into something relative to CWD. 
	let l:adjustedDirspec = fnamemodify(l:dirspec, ':.' )
    else
	" One common backup directory for all original files. 
	let l:dirspec = simplify(fnamemodify( l:backupDir . '/./', ':p' ))

	" Dirspec should be (and already is) an absolute path. 
	let l:adjustedDirspec = l:dirspec
    endif
    if ! isdirectory( l:adjustedDirspec ) && ! a:isQueryOnly
	throw printf("WriteBackup: Backup directory '%s' does not exist!", l:dirspec)
    endif
    return l:adjustedDirspec . l:originalFilename
endfunction

function! writebackup#GetBackupFilename( originalFilespec, isForced )
"*******************************************************************************
"* PURPOSE:
"   Determine the next available backup version and return the backup filename. 
"* ASSUMPTIONS / PRECONDITIONS:
"   None. 
"* EFFECTS / POSTCONDITIONS:
"   None. 
"* INPUTS:
"   a:originalFilespec	Original file.
"   a:isForced	Flag whether running out of backup versions is not allowed, and
"		we'd rather overwrite the last backup. 
"* RETURN VALUES: 
"   Next available backup filespec (that does not yet exist) for
"   a:originalFilespec. If a:isForced is set and no more versions are available,
"   the last (existing) backup filespec ('.YYYYMMDDz') is returned. 
"   Throws 'WriteBackup: Ran out of backup file names'. 
"*******************************************************************************
    let l:date = strftime( "%Y%m%d" )
    let l:nr = 'a'
    while l:nr <= 'z'
	let l:backupFilespec = writebackup#AdjustFilespecForBackupDir( a:originalFilespec, 0 ) . '.' . l:date . l:nr
	if( filereadable( l:backupFilespec ) )
	    " Current backup letter already exists, try next one. 
	    " Vimscript cannot increment characters; so convert to number for increment. 
	    let l:nr = nr2char( char2nr(l:nr) + 1 )
	    continue
	endif
	" Found unused backup letter. 
	return l:backupFilespec
    endwhile

    " All backup letters a-z are already used. 
    if a:isForced
	return l:backupFilespec
    else
	throw 'WriteBackup: Ran out of backup file names'
    endif
endfunction

function! writebackup#WriteBackup( isForced )
"*******************************************************************************
"* PURPOSE:
"   Back up the current buffer contents to the next available backup file. 
"* ASSUMPTIONS / PRECONDITIONS:
"   None. 
"* EFFECTS / POSTCONDITIONS:
"   Writes backup file, or:
"   Prints error message. 
"   May overwrite last backup when running out of backup files and a:isForced. 
"   May create and delete a backup file when buffer is modified and check for
"   identical backups is positive. 
"* INPUTS:
"   a:isForced	Flag whether creation of a new backup file is forced, i.e. even
"		if contents are identical or when no more backup versions (for
"		this day) are available. 
"* RETURN VALUES: 
"   None. 
"*******************************************************************************
    let l:saved_cpo = &cpo
    set cpo-=A
    try
	let l:originalFilespec = expand('%')
	let l:isNeedToCheckForIdenticalPredecessorAfterBackup = 0
	if s:ExistsWriteBackupVersionControlPlugin()
	    if ! writebackupVersionControl#IsOriginalFile(l:originalFilespec)
		throw 'WriteBackup: You can only backup the latest file version, not a backup file itself!'
	    elseif g:WriteBackup_AvoidIdenticalBackups && ! a:isForced
		if &l:modified
		    " The current buffer is modified; we can only check for an
		    " identical backup after the buffer has been written. 
		    let l:isNeedToCheckForIdenticalPredecessorAfterBackup = 1
		else
		    " As the current buffer isn't modified, we just need to compare
		    " the saved buffer contents with the last backup (if that
		    " exists). 
		    let l:currentBackupVersion = writebackupVersionControl#IsIdenticalWithPredecessor(l:originalFilespec)
		    if ! empty(l:currentBackupVersion)
			throw printf("WriteBackup: This file is already backed up as '%s'", l:currentBackupVersion)
		    endif
		endif
	    endif
	endif

	let l:backupFilespec = writebackup#GetBackupFilename(l:originalFilespec, a:isForced)
	let l:backupExFilespec = escapings#fnameescape(l:backupFilespec)
	execute 'write' . (a:isForced ? '!' : '')  l:backupExFilespec

	if l:isNeedToCheckForIdenticalPredecessorAfterBackup
	    let l:identicalPredecessorVersion = writebackupVersionControl#IsIdenticalWithPredecessor(l:backupFilespec)
	    if ! empty(l:identicalPredecessorVersion)
		call writebackupVersionControl#DeleteBackup(l:backupFilespec, 0)
		throw printf("WriteBackup: This file is already backed up as '%s'", l:identicalPredecessorVersion)
	    endif
	endif
    catch /^WriteBackup\%(VersionControl\)\?:/
	echohl ErrorMsg
	let v:errmsg = substitute(v:exception, '^WriteBackup\%(VersionControl\)\?:\s*', '', '')
	echomsg v:errmsg
	echohl None
    catch /^Vim\%((\a\+)\)\=:E/
	echohl ErrorMsg
	let v:errmsg = substitute(v:exception, '^Vim\%((\a\+)\)\=:', '', '')
	echomsg v:errmsg
	echohl None
    finally
	let &cpo = l:saved_cpo
    endtry
endfunction

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
plugin/writebackup.vim	[[[1
78
" writebackup.vim: Write backups of current file with date file extension.  
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher. 
"
" Copyright: (C) 2007-2009 by Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
let s:version = 210
" REVISION	DATE		REMARKS 
"   2.10.017	27-May-2009	Changes in the autoload script; just bumped
"				version number here. 
"   2.00.016	22-Feb-2009	Added [!] to WriteBackup command. 
"   2.00.015	21-Feb-2009	Added g:WriteBackup_AvoidIdenticalBackups
"				configuration. 
"   2.00.014	17-Feb-2009	Moved functions from plugin to separate autoload
"				script. 
"   1.31.013	16-Feb-2009	Split off documentation into separate help file. 
"   1.30.012	13-Feb-2009	Extracted version number and put on a more
"				prominent place, so that it gets updated. 
"   1.30.011	11-Feb-2009	BF: On Unix, fnamemodify() doesn't simplify the
"				'/./' part; added explicit simplify() call. 
"   1.30.010	24-Jan-2009	BF: Unnamed buffers were backed up as
"				'.YYYYMMDDa'; now checking for empty original
"				filespec and throwing exception. 
"				BF: Now also allowing relative backup dir
"				in an upper directory (i.e.
"				g:WriteBackup_BackupDir starting with '../'. 
"   1.30.009	23-Jan-2009	ENH: The backup directory can now be determined
"				dynamically through a callback function. 
"				Renamed configuration variable from
"				g:writebackup_BackupDir to
"				g:WriteBackup_BackupDir. 
"   1.20.008	16-Jan-2009	Now setting v:errmsg on errors. 
"   1.20.007	21-Jul-2008	BF: Using ErrorMsg instead of Error highlight
"				group. 
"   1.20.006	13-Jun-2008	Added -bar to :WriteBackup, so that commands can
"				be chained together. 
"   1.20.005	18-Sep-2007	ENH: Added support for writing backup files into
"				a different directory (either one static backup
"				dir or relative to the original file) via
"				g:writebackup_BackupDir configuration, as
"				suggested by Vincent DiCarlo. 
"				Now requiring Vim 7.0 or later, because it's
"				using lists. 
"				BF: Special ex command characters ' \%#' must be
"				escaped for ':w' command. 
"   1.00.004	07-Mar-2007	Added documentation. 
"	0.03	06-Dec-2006	Factored out WriteBackup_GetBackupFilename() to
"				use in :WriteBackupOfSavedOriginal. 
"	0.02	14-May-2004	Avoid that the written file becomes the
"				alternate file (via set cpo-=A)
"	0.01	15-Nov-2002	file creation

" Avoid installing twice or when in unsupported Vim version. 
if exists('g:loaded_writebackup') || (v:version < 700)
    finish
endif
let g:loaded_writebackup = s:version
" Note: We cannot check for the existence of the writebackupVersionControl
" plugin here, as it will only be sourced _after_ this plugin. 

"- configuration --------------------------------------------------------------
if ! exists('g:WriteBackup_BackupDir')
    let g:WriteBackup_BackupDir = '.'
endif

if ! exists('g:WriteBackup_AvoidIdenticalBackups')
    let g:WriteBackup_AvoidIdenticalBackups = 1
endif

"- commands -------------------------------------------------------------------
command! -bar -bang WriteBackup call writebackup#WriteBackup(<bang>0)

unlet s:version
" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
doc/writebackup.txt	[[[1
191
*writebackup.txt*       Write backups of current file with date file extension. 

			WRITE BACKUP    by Ingo Karkat
							  *writebackup.vim*
description			|WriteBackup-description|
usage	    			|WriteBackup-usage|
installation   			|WriteBackup-installation|
configuration  			|WriteBackup-configuration|
known problems			|WriteBackup-known-problems|
todo				|WriteBackup-todo|
history				|WriteBackup-history|

==============================================================================
DESCRIPTION					     *WriteBackup-description*

This is a poor man's revision control system, a primitive alternative to CVS,
RCS, Subversion, etc., which works with no additional software and almost any
file system. 
The :WriteBackup command writes subsequent backups of the current file with a
'current date + counter' file extension (format '.YYYYMMDD[a-z]'). The first
backup of a day has letter 'a' appended, the next 'b', and so on. (So that a
file can be backed up up to 26 times on any given day.) 

By default, backups are created in the same directory as the original file,
but they can also be placed in a directory relative to the original file, or
in one common backup directory for all files (similar to Vim's 'backupdir'
option), or even in a file-specific location that is determined via a
user-provided callback function. 

==============================================================================
USAGE							   *WriteBackup-usage*
								*:WriteBackup*
:WriteBackup[!]
			Write the whole current buffer to the next available
			backup file with a '.YYYYMMDD[a-z]' file extension. 
			If the last backup is identical with the current
			buffer contents, no (redundant) backup is written. 
			With [!], creation of a new backup file is forced: 
			- even if the last backup is identical
			- even when no more backup versions (for this day) are
			  available (the last '.YYYYMMDDz' backup gets
			  overwritten, even if it is readonly)

PS: In addition to this Vim script, I also provide the basic writebackup
functionality outside of Vim as VBScript and Korn Shell script versions at
http://ingo-karkat.de/downloads/tools/writebackup/index.html

==============================================================================
INSTALLATION					    *WriteBackup-installation*

This script is packaged as a |vimball|. If you have the "gunzip" decompressor
in your PATH, simply edit the *.vba.gz package in Vim; otherwise, decompress
the archive first, e.g. using WinZip. Inside Vim, install by sourcing the
vimball or via the |:UseVimball| command. >
    vim writebackup.vba.gz
    :so %
To uninstall, use the |:RmVimball| command. 

DEPENDENCIES					    *WriteBackup-dependencies*

- Requires Vim 7.0 or higher. 
- The writebackupVersionControl plugin (vimscript #1829) complements this
  script with addtional commands and enhances the :WriteBackup command with
  additional checks, but is not required. 

==============================================================================
CONFIGURATION					   *WriteBackup-configuration*

For a permanent configuration, put the following commands into your |vimrc|:

						     *g:WriteBackup_BackupDir*
To put backups into another directory, specify a backup directory via >
    let g:WriteBackup_BackupDir = 'D:\backups'
Please note that this setting may result in name clashes when backing up files
with the same name from different directories!

A directory starting with './' or '../' (or the backslashed-variants '.\' for
MS-DOS et al.) puts the backup file relative to where the backed-up file is.
The leading '.' is replaced with the path name of the current file: >
    let g:WriteBackup_BackupDir = './backups'
<
Backup creation will fail if the backup directory does not exist, the
directory will NOT be created automatically! 

					       *WriteBackup-dynamic-backupdir*
If you want to automatically create a non-existing backup directory,
dynamically determine the backup directory based on the current filespec or
any other changing circumstances, you can set a custom callback function: >

    function MyResolveBackupDir(originalFilespec, isQueryOnly)
        ...
        return backupDirspec
    endfunction
    let g:WriteBackup_BackupDir = function('MyResolveBackupDir')
<
This function will be invoked each time a backup is about to be written. The
function must accept one String argument that represents the filespec of the
original file (the filespec can be relative or absolute, like the output of
expand('%')), and one Number that represents a boolean flag whether this is
just a query (no backup is about to be written, so don't cause any permanent
side effects).
It must return a String representing the backup dirspec (again either relative
or absolute, '.' for current directory, please no trailing path separator). 
Throw an exception if you want to abort the backup. If the exception starts
with 'WriteBackup:', the rest of the exception text will be nicely printed as
the error text to the user. 

Remember that because of the alphabetic numbering, it doesn't make much sense
if the backup directory changes for subsequent backups of the same file. Use
this functionality to adapt the backup location based on filespec, file type,
availability of a backup medium, etc., or to inject additional side effects
like creating backup directories, pruning old backups, etc. 

						     *b:WriteBackup_BackupDir*
You can override this global setting for specific buffers via a buffer-scoped
variable, which can be set by an autocmd, ftplugin, or manually: >
    let b:WriteBackup_BackupDir = 'X:\special\backup\folder'
<

					 *g:WriteBackup_AvoidIdenticalBackups*
If the writebackupVersionControl plugin is installed, no backup is written if
there is an identical predecessor, so you don't need to remember whether
you've already backed up the current file; no redundant backups will be
created. If you don't like this check, turn it off via: >
    let g:WriteBackup_AvoidIdenticalBackups = 0
<

							   *WriteBackup-alias*
In case you already have other custom Vim commands starting with W, you can
define a shorter command alias ':W' in your vimrc to save some keystrokes. I
like the parallelism between ':w' for a normal write and ':W' for a backup
write. >
    command -bar -bang W :WriteBackup<bang>
<
==============================================================================
KNOWN PROBLEMS					  *WriteBackup-known-problems*

TODO							    *WriteBackup-todo*

==============================================================================
HISTORY							 *WriteBackup-history*

2.10	27-May-2009
Replaced simple filespec escaping with built-in fnameescape() function (or
emulation for Vim 7.0 / 7.1) via escapings.vim wrapper.

2.00	22-Feb-2009
- Using separate autoload script to help speed up Vim startup. This is an
  incompatible change that also requires the corresponding
  writebackupVersionControl plugin version. *** PLEASE UPDATE
  writebackupVersionControl (vimscript #1829), too, if you're using it ***
- ENH: Disallowing backup of backup file if the writebackupVersionControl
  plugin is installed. 
- ENH: No backup is written if there is an identical previous backup. This
  requires the writebackupVersionControl plugin and can be configured via
  g:WriteBackup_AvoidIdenticalBackups. 

1.31	16-Feb-2009
Split off documentation into separate help file. Now packaging as VimBall.

1.30	13-Feb-2009
- ENH: The backup directory can now be determined dynamically through a
  callback function.
- Renamed configuration variable from g:writebackup_BackupDir to
  g:WriteBackup_BackupDir. *** PLEASE UPDATE YOUR CONFIGURATION ***
- BF: Now also allowing relative backup dir in an upper directory (i.e.
  g:WriteBackup_BackupDir starting with '../'.
- BF: Unnamed buffers were backed up as '.YYYYMMDDa'.
- Now setting v:errmsg on errors and using ErrorMsg instead of Error highlight
  group. 

1.20	18-Sep-2007
- ENH: Added support for writing backup files into a different directory
  (either one static backup dir or relative to the original file) via
  g:writebackup_BackupDir configuration, as suggested by Vincent DiCarlo. 
- Now requiring Vim 7.0 or later, because it's using lists. 
- BF: Special ex command characters ' \%#' must be escaped for ':w' command. 

1.00	07-Mar-2007
Added documentation. First release. 

0.01	15-Nov-2002
Started development. 

==============================================================================
Copyright: (C) 2007-2009 by Ingo Karkat
The VIM LICENSE applies to this script; see |copyright|. 

Maintainer:	Ingo Karkat <ingo@karkat.de>
==============================================================================
 vim:tw=78:ts=8:ft=help:norl:
