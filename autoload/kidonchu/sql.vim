function! kidonchu#sql#OpenSQL()
	let sqlFilename = '~/.vim/sqls/queries.sql'
	execute "e " . sqlFilename
endfunction
