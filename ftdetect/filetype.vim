"
" Intel specific file types

augroup filetypedetect

" Timing BVR and EVR files
au! BufNewFile,BufRead *.bvr,*.evr           setfiletype bvr

" HDL Hierarchy files
au! BufNewFile,BufRead *.hier                setfiletype hier

" IHDL 
au! BufNewFile,BufRead *.pro*,*.hdl,*.def,*.ifc,*.proc,*.def,*.typ,*.smdl  setfiletype iHDL
"au! BufNewFile,BufRead *.hdl                 setfiletype iHDL

" DMS.pth
au! BufNewFile,BufRead *.pth,*.pth.*         setfiletype dmspth

" Sas
au! BufNewFile,BufRead *.sas                 setfiletype sas

" SCH files
au! BufNewFile,BufRead *.sch,*.iif,*.isp,*.?ux setfiletype schem

" SIG files (SDB)
au! BufNewFile,BufRead *.sig                 setfiletype sig

" Skill files
au! BufNewFile,BufRead *.il,*.ski            setfiletype skill

" MACE programs
au! BufNewFile,BufRead *.mace,*.m            setfiletype perl

" Watch windows 
let g:filetype_w="perl"

" PBIST programs
au! BufNewFile,BufRead *.pb,*.pbist          setfiletype pbist

" Teradyne vectors
au! BufNewFile,BufRead *.lvm,*.lvmadr        setfiletype lvm

" Bus checker output
au! BufNewFile,BufRead ibus.out,ebus.out     setfiletype buschecker

" Multicycle configuration
au! BufNewFile,BufRead *.multicycle*         setfiletype multicycle

" Multicycle configuration
au! BufNewFile,BufRead *.v,*.vs*,*.vh,*.def,*.sv,*.svh,*.vg            setfiletype verilog_systemverilog

aug END

