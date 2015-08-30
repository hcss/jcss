  _=require("underscore")
  fs=require("fs")
  module.exports=(tagAndSelector)->
    #console.log tagAndSelector
    #console.log tagAndSelector
    html= _renderToTags tagAndSelector
    fs.writeFile './message.html', html,(err)->
      throw err if err?
      console.log 111





  _renderToTags=(tas)->
    html="<#{tas.tagName}"
    html=html+" class="+tas.className if tas.className? and tas.className != ""
    html=html+" id="+tas.id if tas.id? and tas.id != ""
    html=html+">"
    if tas? and tas.length? and tas.length > 0
      for e in tas
        html=html+_renderToTags(e)
    html=html+"</#{tas.tagName}>"
