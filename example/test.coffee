  $=require "./jcss"


  header = $ "header",[
    $.text "oh my god"
    "background-color:#fff"
    "margin-left:10px"
    $ "img.logo",[
      "width : 40px"
    ]


  ]

  $.render header
  module.exports=header
