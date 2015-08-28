_=require("underscore")

dom =(selector,contents)->
  # console.log 11111111111111111111111111111111,selector
  throw new Error("selector must be string") unless _.isString(selector)
  throw new Error("content must be array") unless _.isArray(contents)
  tagAndSelector = new Dom(selector)
  for item in contents
    if(_.isString(item))
      style = item
      tagAndSelector.css(style)
    else if (item instanceof Dom)
      child = item
      tagAndSelector.push(item)
  completeSelector tagAndSelector


  tagAndSelector
dom.text = (value)->

# 遍历子节点 将selector 改成给予父类的完整路径
completeSelector = (tagAndSelector)->
  if tagAndSelector? and tagAndSelector.length > 0
    for e in tagAndSelector
      e.selector = tagAndSelector.selector + ">" + e.selector
      completeSelector e






class Dom extends Array

  constructor: (selector) ->
    this.selector=selector
  css:()->
    this.width=20

module.exports=dom
