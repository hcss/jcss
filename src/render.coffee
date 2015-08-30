  _=require("underscore")
  module.exports=(tagAndSelector)->
    #console.log tagAndSelector
    console.log tagAndSelector
    # _renderToTags tagAndSelector
    tags=[]


  _renderToTags=(tas,tags)->




      # for selector in selectors


    if tas? and tas.length? and tas.length > 0
      for e in tas
        _renderToTags e,[]
