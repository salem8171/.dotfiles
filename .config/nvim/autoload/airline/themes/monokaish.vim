" monokaish Airline theme

" #272822
" #23241e
" #1f201a
" #48483e
" #76715e
" #acada1
" #48483e
" #cb376b
" #8fc029
" #d4c96e
" #4aa7b7
" #9358fe
" #56b7a5
" #acada1


" Normal Mode
let s:N1 = [ '#acada1' , '#76715e' , 254 , 237 ]
let s:N2 = [ '#acada1' , '#48483e' , 254 , 239 ]
let s:N3 = [ '#acada1' , '#1f201a' , 255 , 235 ]

" Insert Mode
let s:I1 = [ '#acada1' , '#76715e' , 254 , 237 ]
let s:I2 = [ '#acada1' , '#48483e' , 254 , 239 ]
let s:I3 = [ '#acada1' , '#1f201a' , 255 , 235 ]

" Visual Mode
let s:V1 = [ '#acada1' , '#76715e' , 254 , 237 ]
let s:V2 = [ '#acada1' , '#48483e' , 254 , 239 ]
let s:V3 = [ '#acada1' , '#1f201a' , 255 , 235 ]

" Replace Mode
let s:R1 = [ '#acada1' , '#76715e' , 254 , 237 ]
let s:R2 = [ '#acada1' , '#48483e' , 254 , 239 ]
let s:R3 = [ '#acada1' , '#1f201a' , 255 , 235 ]

" Inactive Mode
let s:IA = [ '#76715e' , '#1f201a' , 242 , 235 , '' ]
 
let g:airline#themes#monokaish#palette = {}
let g:airline#themes#monokaish#palette.normal  = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#monokaish#palette.insert  = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#monokaish#palette.visual  = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#monokaish#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#monokaish#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Warning Mode
let s:WI = [ '#1f201a' , '#d4c96e' , 234 , 215 , '' ]
let g:airline#themes#monokaish#palette.normal.airline_warning = [s:WI[0], s:WI[1], s:WI[2], s:WI[3]]
let g:airline#themes#monokaish#palette.insert.airline_warning  = g:airline#themes#monokaish#palette.normal.airline_warning
let g:airline#themes#monokaish#palette.visual.airline_warning  = g:airline#themes#monokaish#palette.normal.airline_warning
let g:airline#themes#monokaish#palette.replace.airline_warning = g:airline#themes#monokaish#palette.normal.airline_warning

" Error Mode
let s:ER = [ '#1f201a' , '#cb376b' , 234 , 167 , '' ]
let g:airline#themes#monokaish#palette.normal.airline_error = [s:ER[0], s:ER[1], s:ER[2], s:ER[3]]
let g:airline#themes#monokaish#palette.insert.airline_error    = g:airline#themes#monokaish#palette.normal.airline_error
let g:airline#themes#monokaish#palette.visual.airline_error    = g:airline#themes#monokaish#palette.normal.airline_error
let g:airline#themes#monokaish#palette.replace.airline_error   = g:airline#themes#monokaish#palette.normal.airline_error

" Terminal
let s:TE = [ '#acada1' , '#1f201a' , 254 , 237 , '' ]
let g:airline#themes#monokaish#palette.normal.airline_term = [s:TE[0], s:TE[1], s:TE[2], s:TE[3]]
let g:airline#themes#monokaish#palette.insert.airline_term  = g:airline#themes#monokaish#palette.normal.airline_term
let g:airline#themes#monokaish#palette.visual.airline_term  = g:airline#themes#monokaish#palette.normal.airline_term
let g:airline#themes#monokaish#palette.replace.airline_term = g:airline#themes#monokaish#palette.normal.airline_term
let g:airline#themes#monokaish#palette.inactive.airline_term = g:airline#themes#monokaish#palette.normal.airline_term

" Accents
let g:airline#themes#monokaish#palette.accents = { 'red': [ '#cb376b' , '' , 167 , '' ] }

" CtrlP
if get(g:, 'loaded_ctrlp', 0)
    let g:airline#themes#monokaish#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
            \ [ '#E4E4E4' , '#1f201a' , 254 , 235 , ''     ],
            \ [ '#E4E4E4' , '#23241e' , 254 , 239 , ''     ],
            \ [ '#585858' , '#E4E4E4' , 240 , 254 , 'bold' ])
endif
