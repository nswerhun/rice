" Vim syntax file
" Language:	C++
" Maintainer:	Noah Swerhun
" Last Change:	2020 Dec 09
" Adds:
"  - namespaces are italic and orange
" NOTE: Includes all C sytax.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match cppInCodeNamespace display "\v<[A-Za-z0-9]*::"
hi def link cppInCodeNamespace StorageClass

hi def link cppStructure StorageClass
