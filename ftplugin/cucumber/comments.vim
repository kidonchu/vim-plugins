function! <SID>CommentAllButMe()

	" mark current position into h register
	execute 'normal! mh'

	" move to top
	execute 'normal! gg'

	" find first scenario
	let pattern = '\v^\s*Scenario:.*'

	let curPos = getpos('.')
	let curLine = curPos[1]

	execute 'normal! /' . pattern . "\<cr>"

	let jumpPos = getpos('.')
	let jumpLine = jumpPos[1]

	" if no scenario found, nothing to do
	if curLine == jumpLine
		echom "No Scenarios Found"
		return ''
	endif

	" comment out all scenarios
	execute "normal! VG:Commentary\<cr>"

	" jump to where we were
	execute "normal! 'h"

	" uncomment the current scenario
	execute "normal! vip:Commentary\<cr>"

	" jump to where we were again
	execute "normal! 'h"

endfunction

function! <SID>UncommentAllButMe()

	" mark current position into h register
	execute 'normal! mh'

	" comment myself
	execute "normal! vip:Commentary\<cr>"

	" move to top
	execute 'normal! gg'

	" find first scenario
	let pattern = '\v^\s*#\s*Scenario:.*'

	let curPos = getpos('.')
	let curLine = curPos[1]

	execute 'normal! /' . pattern . "\<cr>"

	let jumpPos = getpos('.')
	let jumpLine = jumpPos[1]

	" uncomment all
	execute "normal! VG:Commentary\<cr>"

	" jump to where we were
	execute "normal! 'h"

endfunction

nnoremap <script> <buffer> <silent> <leader>co
	\ :call <SID>CommentAllButMe()<cr>

nnoremap <script> <buffer> <silent> <leader>cu
	\ :call <SID>UncommentAllButMe()<cr>
