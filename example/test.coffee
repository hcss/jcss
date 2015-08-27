$=require "./build/jcss"

header = $ "header",[
  $ "img.logo",[
    $.backgroundColor "red"
    $.width "40px"
    $.attr.src "./img/jcss"
  ]
  $ "title",[
    $.text "oh my god"
    $.color "blck"
  ]
]
