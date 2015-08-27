_=require("underscore")

dom =(selector,contents)->
  console.log 11111111111111111111111111111111,selector
  throw new Error("selector must be string") unless _.isString(selector)
  throw new Error("content must be array") unless _.isArray(contents)
  # item.call({}) for item in contents when _.isFunction(item)
  # ()->
  #   console.log @ is global
  tagAndSelector = new Dom(selector)
  for item in contents
    if(_.isString(item))
      tagAndSelector.css(item)
    else if (item instanceof Dom)
      item.selector=selector+">"+item.selector
      tagAndSelector.push(item)
  tagAndSelector
dom.text = (value)->





class Dom extends Array

  constructor: (selector) ->
    this.selector=selector
  css:()->
    this.width=20

module.exports=dom
