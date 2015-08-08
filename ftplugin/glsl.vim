" Vim filetype plugin file
" Language:		OpenGL Shading Language (GLSL)
" Maintainer:	Brendan Robeson (https://github.com/brobeson/Tools)
" Last Change:	2015 August 3

" Only do this when not done yet for this buffer
if exists('b:did_ftplugin')
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Using line continuation here.
let s:cpo_save = &cpo
set cpo-=C

" TODO	add the undo for ofu after autoloading functions are added to glsl
"let b:undo_ftplugin = 'setl fo< com< ofu<'
let b:undo_ftplugin = 'setl formatoptions< comments< foldmethod<'

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using 'o'.
setlocal formatoptions-=t formatoptions+=croql

" Set completion with CTRL-X CTRL-O to autoloaded function.
"if exists('&ofu')
"	setlocal ofu=glslcomplete#Complete
"endif

" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" When the matchit plugin is loaded, this makes the % command skip parens and
" braces in comments.
let b:match_words = &matchpairs . ',^\s*#\s*if\(\|def\|ndef\)\>:^\s*#\s*elif\>:^\s*#\s*else\>:^\s*#\s*endif\>'
let b:match_skip = 's:comment\|string\|character'

" set up code folding
setlocal foldmethod=syntax

" files in the browse dialog
if (has('gui_win32') || has('gui_gtk')) && !exists('b:browsefilter')
	let b:browsefilter = 'GLSL Source Files (*.glsl)\t*.glsl\n' .
					   \ 'All Files (*.*)\t*.*\n'
endif

let &cpo = s:cpo_save
unlet s:cpo_save
