" Vim syntax file
" Language:	Logiops Configuration File
" Maintainer:	Noah Swerhun
" Last Change:	2020 Dec 25

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword lpsDeviceObject   devices
syn keyword lpsObjectFields   buttons smartshift hiresscroll thumbwheel left right proxy touch tap gestures
syn keyword lpsParamFields name cid action dpi on threshold default_threshold hires invert target up down divert invert direction mode dpis
syn keyword lpsActions type keys 

syn match   lpsComment        '//.*'
syn match   lpsQuotedText         '".*"'

hi def link lpsDeviceObject Statement
hi def link lpsObjectFields StorageClass
hi def link lpsParamFields Type
hi def link lpsActions Type
hi def link lpsComment Comment
hi def link lpsQuotedText String
