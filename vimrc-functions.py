#!/usr/intel/bin/python3

import binascii
import vim

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


