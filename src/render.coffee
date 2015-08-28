  _=require("underscore")
  module.exports=(tagAndSelector)->
    tags=[]





  renderToTags=(tagAndSelector,tags)->
    if tagAndSelector? and tagAndSelector.length? and tagAndSelector.length > 0
      for e in tagAndSelector
        tagName = "<div"
        if e.selector.indexOf('.') > -1
          tagName = tagName + 'class="wode"'
        if e.selector.indexOf('#') > -1
          tagName = tagName + 'id="555"'
        tagName = tagName + '>'
        tags.push(tagName) 
