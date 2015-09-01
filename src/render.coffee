  _=require("underscore")
  fs=require("fs")
  util=require("./util.js")
  module.exports=(tagAndSelector)->
    #console.log tagAndSelector
    #console.log tagAndSelector
    console.log tagAndSelector.attributes
    html= _renderToTags tagAndSelector
    css =_renderToCss tagAndSelector
    #console.log tagAndSelector
    console.log css
    fs.writeFile './message.html', html,(err)->
      throw err if err?
      console.log 111
    fs.writeFile './message.css', css,(err)->
      throw err if err?
      console.log 111





  _renderToTags=(tas)->
    console.log tas.attributes
    html="<#{tas.tagName}"

    for attribute in  tas.attributes
      html=html+" "+attribute.name
      html=html+"="+attribute.value+" " if attribute.value isnt ""
    html=html+">"
    if tas? and tas.length? and tas.length > 0
      for e in tas
        html=html+_renderToTags(e)
    html=html+"</#{tas.tagName}>"
  _renderToCss = (tas)->
    # init css prevent css=css+_renderToCss(e) css undefiended
    css=""
    styleNames = Object.keys(tas.style)
    if styleNames.length isnt 0
      console.log tas.completeSelector
      css=tas.completeSelector+"{\n"
      for styleName in styleNames
        css=css+util.resolveStyle(styleName)+":"+ tas.style[styleName]+";\n"
      css=css+"}\n"
      #css=ta
    if tas? and tas.length? and tas.length > 0
      for e in tas
        css=css+_renderToCss(e)
    css
