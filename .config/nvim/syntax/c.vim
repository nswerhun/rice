" Vim syntax file
" Language:	C
" Maintainer:	Noah Swerhun
" Last Change:	2020 Dec 20
" Adds:
"  - macros are green in-code

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Recognize macros in-code
syn match cInCodeMacro display "\v<[A-Z_]{3,}(\s*\=)@!>" contains=@cDefine
hi def link cInCodeMacro		Macro
