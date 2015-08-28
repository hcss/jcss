  _=require("underscore")
  util=require("./util.js")


  dom =(selector,contents)->

    throw new Error("selector must be string") unless _.isString(selector)
    throw new Error("content must be array") unless _.isArray(contents)
    tagAndSelector = new Dom(selector)
    for item in contents
      if(_.isString(item))
        style = item
        tagAndSelector.setStyle(style)
      else if (item instanceof Dom)
        child = item
        tagAndSelector.push(item)
    generateCompleteSelector tagAndSelector


    tagAndSelector
  dom.render = (value)->
    

  # absolut  completeSelector for example div -> header>div
  generateCompleteSelector = (tagAndSelector)->
    if tagAndSelector? and tagAndSelector.length? and tagAndSelector.length > 0
      for e in tagAndSelector
        e.completeSelector=tagAndSelector.completeSelector+">"+e.selector
        generateCompleteSelector e














  class Dom extends Array

    constructor: (selector) ->
      this.selector=selector
      this.style={}
    setStyle:(style)->
      styles=style.split(":")
      if(styles.length is 2)
        this.style[util.convertStyle styles[0]] = styles[1]






  module.exports=dom
