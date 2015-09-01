  $=require "./jcss"


  header = $ "header",[
    "background-color:#fff"
    "margin-left:10px"
    $ "img.logo",[
      "width : 40px"
      "height : 50px"
    ]
    $ "title#beigin",[
      $ "span#content",[
        "color : red"
        $ """span[href="html"][title]""",[
          "color : red"
        ]
      ]

    ]


  ]

  $.render header
  module.exports=header
