#!/usr/intel/bin/python3

import binascii
import vim
import re

open_quickfix = False

def AlwaysCD():
	vim.command('lcd %:p:h')

def DeleteTrailingWS():
	vim.command('normal mz')
	vim.command('%s/\s\+$//ge')
	vim.command('normal z')


def toggleQuickfix():
	global open_quickfix
	open_quickfix = not open_quickfix
	if open_quickfix:
		cmd = "copen"
	else:
		cmd = "cclose"
	vim.command(cmd)

def print_windows():
	for w in vim.windows:
		print "(ro) buffer:       " + str(w.buffer)
		print_buffer(w.buffer)
		print "(rw) cursor:       " + str(w.cursor)
		print "(rw) width,height: " + str(w.width) + 'x' + str(w.height)

def print_buffer(b):
	print "(ro) name: " + str(b.name)

def list_buffers():
	for b in vim.buffers:
		print "Buffer: " + str(b)


def buffer_functions(b):
	b.append("Append a line to the buffer")
	b.append("Append a line below line number 10",10)
	b.append(["list of lines 1", "list of lines 2"])
	b.append(["list of lines 1 at 10", "list of lines 2"], 10)
	(row,col) = b.mark('(')
	range = b.range(10, 12) # return range object of lines 10-12
	print b.name		# write the buffer file name
	b[0] = "hello!!!"		# replace the top line
	b[0:0] = [ "a line" ]	# add a line at the top
	del b[2]			# delete a line (the third)
	b.append("bottom")		# add a line at the bottom
	n = len(b)			# number of lines
	(row,col) = b.mark('a')	# named mark
	r = b.range(1,5)		# a sub-range of the buffer

def print_current_buffer():
	print "(rw) current.line:   " + str(vim.current.line)
	print "(ro) current.buffer: " + str(vim.current.buffer)
	print "(ro) current.window: " + str(vim.current.window)
	print "(ro) current.range:  " + str(vim.current.range)


## Commentify Code ##

def comment_line_help(prefix,ln):
	plen = len(prefix)
	if ln == "":
		return ln
	elif ln == prefix:
		return ""
	elif re.match("^\s*\n", ln):
		return ""
	elif plen == 2 and re.match("^\s\s[^" + prefix + "]", ln):
		return re.sub("^\s\s", prefix, ln)
	elif plen == 1 and re.match("^\s[^" + prefix + "]", ln):
		return re.sub("^\s", prefix, ln)
	else:
		return prefix + ln

def uncomment_line_help(prefix,ln):
	if   len(prefix) == 0:
		return
	elif len(prefix) == 1:
		rep = " "
	elif len(prefix) == 2:
		rep = "  "

	if ln == "\n":
		return ln

	if  not re.match("^\s*" + prefix, ln):
		return ln
	elif re.match("^\s+" + prefix + "\s", ln):
		p = re.compile('(' + prefix + ')')
		return p.sub(rep, ln)
	elif re.match("^\s+" + prefix , ln):
		p = re.compile('(' + prefix + ')')
		return p.sub("", ln)
	elif re.match("^" + prefix + "\s", ln):
		p = re.compile('(' + prefix + ')')
		return p.sub(rep, ln)
	elif re.match("^" + prefix, ln):
		p = re.compile('(' + prefix + ')')
		return p.sub("", ln)
	else:
		return ln

def get_prefix():
	filetype = vim.eval("&filetype")
	prefix = {}
	prefix['python']  = '#'
	prefix['perl']    = '#'
	prefix['csh']     = '#'
	prefix['tcl']     = '#'
	prefix['verilog_systemverilog']     = '//'
	prefix['c']     = '//'
	prefix['cpp']     = '//'
	prefix['vim']     = '"'
	try:
		return prefix[filetype]
	except:
		return ""

def toggle_comment():
	prefix = get_prefix()
	rng = vim.current.range

	if prefix == "":
		print "WARNING: Need to set prefix for this filetype: " + vim.eval("&filetype")
		return


	if re.match("^\s*" + prefix, vim.current.buffer[rng.start]):
		for i in range(rng.start,rng.end+1):
			try:
				vim.current.buffer[i] = uncomment_line_help(prefix, vim.current.buffer[i])
			except:
				print "Error on line " + str(i)
	else:
		for i in range(rng.start,rng.end+1):
			try:
				before = uncomment_line_help(prefix, vim.current.buffer[i])
				vim.current.buffer[i] = comment_line_help(prefix, before)
			except:
				print "Error on line " + str(i)


def Dumb_TabComplete():
	c = vim.current.window.cursor
	print str(c)




def pytest():
	rng = vim.current.range
	for i in range(rng.start,rng.end+1):
		try:
			vim.command(vim.current.buffer[i])
		except:
			print "Cannot execute: " + vim.command(vim.current.buffer[i])
