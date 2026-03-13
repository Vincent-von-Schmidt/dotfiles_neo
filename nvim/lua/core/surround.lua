vim.cmd([[

function <SID>close_tag(char)

    let currentLine = getline(".")
    execute currentLine[col(".")] == a:char || currentLine[col("."):col(".")+1] == " ".a:char ? "normal! f".a:char : "normal! a".a:char

endfunction

function <SID>if_last_char()

    let lastChar = getline(".")[col(".")-2]
    return lastChar == "(" || lastChar == "[" || lastChar == "{" || lastChar == "\"" || lastChar == "\'" ? 1 : 0

endfunction

function <SID>if_last_and_next_char()
    
    let line = getline(".")
    let charCombo = line[col(".")-2].line[col(".")-1]

    return charCombo == "()" || charCombo == "[]" || charCombo == "{}" || charCombo == "\"\"" || charCombo == "\'\'" ? 1 : 0 

endfunction

inoremap <silent> ( ()<Esc>i
inoremap <silent> [ []<Esc>i
inoremap <silent> { {}<Esc>i
" inoremap <silent><expr> ) <SID>close_tag(")") ? "<Esc>f)a" : ")"
" inoremap <silent><expr> ] <SID>close_tag("]") ? "<Esc>f]a" : "]"
" inoremap <silent><expr> } <SID>close_tag("}") ? "<Esc>f}a" : "}"
inoremap <silent> ) <esc>:call <SID>close_tag(")")<cr>a
inoremap <silent> ] <esc>:call <SID>close_tag("]")<cr>a
inoremap <silent> } <esc>:call <SID>close_tag("}")<cr>a
inoremap <silent><expr> " getline(".")[col(".")-1] == "\"" ? "<Esc>f\"a" : "\"\"<Esc>i"
inoremap <silent><expr> ' getline(".")[col(".")-1] == "'" ? "<Esc>f'a" : "''<Esc>i"
inoremap <silent><expr> <Space> <SID>if_last_char() ? "<Space><Space><Esc>i" : "<Space>"
inoremap <silent><expr> <BS> <SID>if_last_and_next_char() ? "<Esc>xxi" : "<BS>"

]])
