" ======================================================== "
"                          General                         "
" ======================================================== "


" ----------------------------------------------------------
" Forcely enable 256 colors
" 強制使用 256 色
" ----------------------------------------------------------
" Note:
"   t_Co: number of colors
" ----------------------------------------------------------
set t_Co=256


" ----------------------------------------------------------
" Forcely set Background Color Erase (BCE) to NONE.
" 強制設定 BCE 為空
" ----------------------------------------------------------
" Notes:
"   如果 BCE 有顏色，且與 Normal Highlight 所指定的不同，這
" 會導致有文字的地方與沒文字的地方顏色不同，像破圖一樣，透過
" 此設定可修復此問題。
" ----------------------------------------------------------
set t_ut=


" ----------------------------------------------------------
" Enable color for syntax
" 啟用語法上色
" ----------------------------------------------------------
syntax enable



" ======================================================== "
"                           Theme                          "
" -------------------------------------------------------- "


" ----------------------------------------------------------
" Try to load color scheme in order.
" 依照順序嘗試讀取 color scheme
" ----------------------------------------------------------
" Note:
"   let:         Define custom variable.
"   execute:     Run vim command
"   colorscheme: Load specific colorscheme
"   Error E185:  Cannot find color scheme
"
"   Here we use "execute" to load varaible
"   because "colorscheme" do not support that.
"
"   基本上 colorscheme 就是現成的主題，裡面設定的就是
"   Highlight 的參數。
" ----------------------------------------------------------
" Good Schemes:
"   elflord:   舒服且顏色很容易辨識
"   ron:       舒服不刺眼，顏色比上一個少
"   industry:  舒服不刺眼，顏色又比上一個少
"   murphy:    舒服且清晰，不過顏色偏綠
"   pablo:     顏色舒服，容易辨識，註解很淡
"   slate:     顏色很容易辨識
"   torte:     顏色很容易辨識，但是偏藍
"   zellner:   顏色很容易辨識，但是偏紅
"   koehler:   全粗體，展示時最清楚
"   delek:     顏色鮮明突出
"   peachpuff: 顏色鮮明突出
"   default:   預設其實也不錯啦
" ----------------------------------------------------------

let s:scheme = ''
let s:schemes = [ 'pablo', 'elflord', 'ron', 'industry', 'murphy', 'torte' ]

if exists('s:scheme') && s:scheme != ''
    execute 'colorscheme' s:scheme
else
    for s in s:schemes
        try
            execute "colorscheme" s
            break
        catch /^Vim\%((\a\+)\)\=:E185/
             " Catch Error and do nothing.
             " Just continue to try next scheme
        endtry
    endfor
endif


" ======================================================== "
"                    Highlight Override                    "
" -------------------------------------------------------- "
" Notes:                                                   "
"   必須放在 colorscheme 之後，因為 colorscheme 指令其實就 "
"   是 load 一個寫了一堆 highlight 參數的 vim script。     "
"                                                          "
"   因此放在其後才能 override。                            "
"                                                          "
"   由於安裝了 vim-code-dark 為了確保讀取順序為:           "
"       load plugin > load scheme > load override rules    "
"   決定將 highlight override 寫成 autoload function       "
"   需要時隨時調用即可。
" ======================================================== "
call Colors#HiAll()
