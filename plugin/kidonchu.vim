if exists('g:loaded_kidonchu')
	finish
endif

let g:loaded_kidonchu = '0.1.0' " version number

nnoremap <leader><leader>n :call kidonchu#note#OpenStoryNote()<cr>
nnoremap <leader><leader>q :call kidonchu#sql#OpenSQL()<cr>
vnoremap <leader>ets :call kidonchu#ember#ets()<cr>
