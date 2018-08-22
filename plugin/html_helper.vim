" ============================================================================
" File:        html_helper.vim
" Author:      Marc-Antoine Loignon <info@lognoz.com>
" Licence:     MIT licence
"
" Permission is hereby granted to use and distribute this code, with or
" without modifications, provided that this copyright notice is copied with
" it. Like anything else that's free, this plugin is provided *as is* and
" comes with no warranty of any kind, either expressed or implied. In no event
" will the copyright holder be liable for any damamges resulting from the use
" of this software.
" ============================================================================
if exists("g:loaded_html_helper") || &cp
  finish
endif

let g:loaded_html_helper = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:define_variables(settings)
	for [key, value] in items(a:settings)
		let selector = printf('g:html_helper_%s', key)
		if !exists(selector)
			execute printf("let %s='%s'", selector, value)
		endif
	endfor
endfunction

call s:define_variables({
	\ 'multiple_line': 'g<C-m>'
	\ })

if exists('g:html_helper_multiple_line')
	exec 'nnoremap <silent> '.g:html_helper_multiple_line.
	     \' :call html_helper#multiline("n")<CR>'
	exec 'xnoremap <silent> '.g:html_helper_multiple_line.
	     \' :<C-u>call html_helper#multiline("v")<CR>'
endif

let &cpo = s:save_cpo
unlet s:save_cpo
