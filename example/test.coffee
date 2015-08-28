$=require "./jcss"

header = $ "header",[
  $.text "oh my god"
  $ "img.logo",[
    # $.backgroundColor "red"
    # $.width "40px"
    # $.attr.src "./img/jcss"
    "width : 40px"
  ]
  # $ "title",[
  #

  #   # $.color "black"
  # ]
]

console.log header

module.exports=header
