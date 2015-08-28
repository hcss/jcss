$=require "./jcss"

header = $ "header",[
  $.text "oh my god"
  $ "img.logo",[
    # $.backgroundColor "red"
    # $.width "40px"
    # $.attr.src "./img/jcss"
    "width : 40px"
  ]
  $ "title",[
    "height: 50px"
    # $.color "black"
  ]
  $ "div",[
    $ "div",[

    ]
  ]
]

console.log header

module.exports=header
