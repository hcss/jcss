  _=require("underscore")
  util=require("./util.js")

  dom =(selector,contents)->
    throw new Error("selector must be string") unless _.isString(selector)
    throw new Error("content must be array") unless _.isArray(contents)
    tagAndSelector = new Dom(selector)
    for item in contents
      if(_.isString(item))

        tagAndSelector.setStyle(item)
      else if (item instanceof Dom)
        item.selector=selector+">"+item.selector
        tagAndSelector.push(item)
    tagAndSelector
  dom.text = (value)->
  #tas is tagAndSelector
  dom.render=(tas)->
    throw new Error("must be a instance of Dom") unless tas instanceof Dom
    console.log tas










  class Dom extends Array

    constructor: (selector) ->
      this.selector=selector
      this.style={}
    setStyle:(style)->
      styles=style.split(":")
      if(styles.length is 2)
        this.style[util.convertStyle styles[0]] = styles[1]






  module.exports=dom
