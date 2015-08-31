  _=require("underscore")
  module.exports=
    #background-color to backgroundColor
    convertStyle:(s)->
      list=s.split('-')
      for l,i in list when i>0
        list[i]=l[0].toUpperCase()+l[1..]
      list.join('')
    resolveStyle:(s)->
      s=s.replace(/[A-Z]/g,"-$&").toLowerCase()
