  $=require "./jcss"


  header = $ "header",[
    "background-color:#fff"
    "margin-left:10px"
    $ "img.logo",[
      "width : 40px"
    ]
    $ "title#beigin",[
      $ "span#content",[
        "color : red"
        $ "span[href='a']",[
          "color : red"

        ]
      ]

    ]


  ]

  $.render header
  module.exports=header
