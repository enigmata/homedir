" Vim syntax file
" Language:     Multimarkdown
" Maintainer:   Randy Horman (was: Tim Pope <vimNOSPAM@tpope.org>)
" Filenames:    *.mmd
" Last Change:	Nov 7, 2010

if exists("b:current_syntax")
  finish
endif

syn sync minlines=10
syn case ignore

syn match multimarkdownLineStart "^" nextgroup=@multimarkdownBlock
" syn match multimarkdownLineStart "^[<@]\@!" nextgroup=@multimarkdownBlock

syn cluster multimarkdownBlock contains=multimarkdownH1,multimarkdownH2,multimarkdownH3,multimarkdownH4,multimarkdownH5,multimarkdownH6,multimarkdownBlockquote,multimarkdownListMarker,multimarkdownOrderedListMarker,multimarkdownCodeBlock,multimarkdownRule
syn cluster multimarkdownInline contains=multimarkdownLineBreak,multimarkdownLinkText,multimarkdownItalic,multimarkdownBold,multimarkdownCode
" syn cluster multimarkdownInline contains=multimarkdownLineBreak,multimarkdownLinkText,multimarkdownItalic,multimarkdownBold,multimarkdownCode,multimarkdownEscape

syn match multimarkdownMetadataKey "^\(\w\|\s\)\+:" contained nextgroup=@multimarkdownMetadataValue
syn match multimarkdownMetadataValue "\s\+\zs\(\w\|\s\|\.\|\-\|\,\)\+$" contained
syn region multimarkdownMetadata start="\%^" end="\n\n" keepend contains=multimarkdownMetadataValue, multimarkdownMetadataKey 

syn region multimarkdownReference matchgroup=multimarkdownReferenceDelimiter start="\(^\|\(\s\+\)\)\[" end="\]\ze\($\|\(\s\+\)\|[.,;:]\)" oneline

" TODO: Below seems highly error prone (false positives), so need to fix
syn match multimarkdownH1 ".\+\n=\+$" contained contains=@multimarkdownInline,multimarkdownHeadingRule
syn match multimarkdownH2 ".\+\n-\+$" contained contains=@multimarkdownInline,multimarkdownHeadingRule

syn match multimarkdownHeadingRule "^[=-]\+$" contained

syn region multimarkdownH1 matchgroup=multimarkdownHeadingDelimiter start="^#\ze\s\+"       skip="_" end="\s\+\zs#$"      keepend oneline contained
syn region multimarkdownH2 matchgroup=multimarkdownHeadingDelimiter start="^##\ze\s\+"      skip="_" end="\s\+\zs##$"     keepend oneline contained
syn region multimarkdownH3 matchgroup=multimarkdownHeadingDelimiter start="^###\ze\s\+"     skip="_" end="\s\+\zs###$"    keepend oneline contained
syn region multimarkdownH4 matchgroup=multimarkdownHeadingDelimiter start="^####\ze\s\+"    skip="_" end="\s\+\zs####$"   keepend oneline contained
syn region multimarkdownH5 matchgroup=multimarkdownHeadingDelimiter start="^#####\ze\s\+"   skip="_" end="\s\+\zs#####$"  keepend oneline contained
syn region multimarkdownH6 matchgroup=multimarkdownHeadingDelimiter start="^######\ze\s\+"  skip="_" end="\s\+\zs######$" keepend oneline contained

syn match multimarkdownBlockquote ">\s" contained nextgroup=@multimarkdownBlock

syn region multimarkdownCodeBlock start=" \{3,8\}\|\t\{1,4}" end="$" contained

" TODO: real nesting
syn match multimarkdownListMarker "\s*[-*+]\%(\s\+\S\)\@=" contained
syn match multimarkdownOrderedListMarker "\s*\<\d\+\.\%(\s*\S\)\@=" contained

syn match multimarkdownRule "\* *\* *\*[ *]*$" contained
syn match multimarkdownRule "- *- *-[ -]*$" contained

syn match multimarkdownLineBreak "\s\{2,\}$"

syn region multimarkdownIdDeclaration matchgroup=multimarkdownLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=multimarkdownUrl skipwhite
syn match multimarkdownUrl "\S\+" nextgroup=multimarkdownUrlTitle skipwhite contained
syn region multimarkdownUrl matchgroup=multimarkdownUrlDelimiter start="<" end=">" oneline keepend nextgroup=multimarkdownUrlTitle skipwhite contained
syn region multimarkdownUrlTitle matchgroup=multimarkdownUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region multimarkdownUrlTitle matchgroup=multimarkdownUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region multimarkdownUrlTitle matchgroup=multimarkdownUrlTitleDelimiter start=+(+ end=+)+ keepend contained

syn region multimarkdownLinkText matchgroup=multimarkdownLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" keepend nextgroup=multimarkdownLink,multimarkdownId skipwhite contains=@multimarkdownInline
" syn region multimarkdownLinkText matchgroup=multimarkdownLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" keepend nextgroup=multimarkdownLink,multimarkdownId skipwhite contains=@multimarkdownInline,multimarkdownLineStart
syn region multimarkdownLink matchgroup=multimarkdownLinkDelimiter start="(" end=")" contains=multimarkdownUrl keepend contained
syn region multimarkdownId matchgroup=multimarkdownIdDelimiter start="\[" end="\]" keepend contained
syn region multimarkdownAutomaticLink matchgroup=multimarkdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

syn region multimarkdownItalic start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend
" syn region multimarkdownItalic start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=multimarkdownLineStart
" syn region multimarkdownItalic start="\S\@<=_\|_\S\@=" end="\S\@<=_\|_\S\@=" keepend contains=multimarkdownLineStart
syn region multimarkdownBold start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend 
" syn region multimarkdownBold start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=multimarkdownLineStart
" syn region multimarkdownBold start="\S\@<=__\|__\S\@=" end="\S\@<=__\|__\S\@=" keepend contains=multimarkdownLineStart
syn region multimarkdownBoldItalic start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend 
" syn region multimarkdownBoldItalic start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend contains=multimarkdownLineStart
" syn region multimarkdownBoldItalic start="\S\@<=___\|___\S\@=" end="\S\@<=___\|___\S\@=" keepend contains=multimarkdownLineStart
syn region multimarkdownCode matchgroup=multimarkdownCodeDelimiter start="`" end="`" transparent keepend 
syn region multimarkdownCode matchgroup=multimarkdownCodeDelimiter start="`" end="`" transparent keepend
" syn region multimarkdownCode matchgroup=multimarkdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=multimarkdownLineStart
" syn region multimarkdownCode matchgroup=multimarkdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=multimarkdownLineStart

" syn match multimarkdownEscape "\\[][\\`*_{}()#+.!-]"

hi multimarkdownH1                             guifg=green
hi multimarkdownH2                             guifg=yellow
hi multimarkdownH3                             guifg=cyan
hi multimarkdownH4                             guifg=lightmagenta
hi multimarkdownH5                             guifg=darkcyan
hi multimarkdownH6                             guifg=lightgreen
hi def link multimarkdownHeadingRule           multimarkdownRule
hi multimarkdownHeadingDelimiter               guifg=darkgray
hi def link multimarkdownMetadataKey           Identifier
hi multimarkdownMetadataValue                  guifg=darkcyan
hi multimarkdownOrderedListMarker              guifg=cyan
hi multimarkdownListMarker                     guifg=cyan
hi def link multimarkdownBlockquote            Comment
hi multimarkdownCodeBlock                      guifg=grey
hi def link multimarkdownRule                  PreProc

hi multimarkdownLinkText                       guifg=lightyellow cterm=italic cterm=italic gui=italic
hi multimarkdownUrl                            guifg=lightyellow cterm=italic cterm=italic gui=italic
hi multimarkdownIdDeclaration                  guifg=lightred gui=italic
hi multimarkdownId                             guifg=lightred gui=italic
hi def link multimarkdownAutomaticLink         multimarkdownUrl
hi def link multimarkdownUrlTitle              String
hi def link multimarkdownIdDelimiter           multimarkdownLinkDelimiter
hi multimarkdownUrlDelimiter                   guifg=cyan
hi multimarkdownUrlTitleDelimiter              guifg=cyan

hi multimarkdownItalic                         term=italic cterm=italic gui=italic
hi multimarkdownBold                           term=bold cterm=bold gui=bold
hi multimarkdownBoldItalic                     term=italic,bold cterm=italic,bold gui=italic,bold
hi multimarkdownCodeDelimiter                  guifg=cyan
hi multimarkdownCode                           term=italic cterm=italic gui=italic
hi multimarkdownReferenceDelimiter             guifg=cyan
hi multimarkdownReference                      term=underline cterm=underline gui=underline

" hi def link multimarkdownEscape                Special

let b:current_syntax = "multimarkdown"

" vim:set sw=2:
