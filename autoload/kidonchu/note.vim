function! kidonchu#note#OpenStoryNote()
	let branch = system("git br 2&> /dev/null | grep '\*' | awk '{print $2}'")
	echom "branch: " . branch
	let ticket = matchlist(branch, '\v(bugfix|feature)/([0-9]+)(-.*)?')
	echom "ticket[0]: " . ticket[0]

	" If not in the context of bugfix or feature story, no need to open note
	if len(ticket) < 2
		return
	endif

	let ticket = ticket[2]
	echom "ticket[2]: " . ticket
	let noteFilename = '~/.vim/notes/note-' . ticket . '.md'

	echom "noteFilename: " . noteFilename

	execute "e " . noteFilename

endfunction
