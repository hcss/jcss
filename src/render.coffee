  _=require("underscore")
  module.exports=(tagAndSelector)->
    console.log tagAndSelector
    renderToTags tagAndSelector
    tags=[]


  renderToTags=(tagAndSelector,tags)->
    if tagAndSelector? and tagAndSelector.length? and tagAndSelector.length > 0
      for e in tagAndSelector
        console.log e.selector.match(/^\w*\b|\.\w*\b|\#\w*\b|\b\[\w*\]\b/g)
        renderToTags e,[]
