  _=require("underscore")
  util=require("./util.js")
  String.prototype.trim=()->
    @replace(/\s/g, "")


  dom =(selector,contents)->
    throw new Error("selector must be string") unless _.isString(selector)
    throw new Error("content must be array") unless _.isArray(contents)
    tagAndSelector = new Dom(selector)
    tagAndSelector.completeSelector = tagAndSelector.selector
    for item in contents
      if(_.isString(item))
        style = item
        tagAndSelector.setStyle(style)
      else if (item instanceof Dom)
        child = item
        tagAndSelector.push(item)
    _generateCompleteSelector tagAndSelector
    tagAndSelector


  dom.render=(tas)->
    # console.log tas
    throw new Error("must be a instance of Dom") unless tas instanceof Dom
    require('./render.js')(tas)


  # absolut  completeSelector for example div -> header>div
  _generateCompleteSelector = (tagAndSelector)->
    if tagAndSelector? and tagAndSelector.length? and tagAndSelector.length > 0
      for e in tagAndSelector
        e.completeSelector=tagAndSelector.completeSelector+">"+e.selector
        _generateCompleteSelector e

  class Dom extends Array

    constructor: (selector) ->
      @selector=selector
      @attributes=[]
      @style={}
      [@tagName,@className,@id,@attributes]=_resolveSelector(selector)
    setStyle:(style)->
      style=style.trim()
      styles=style.split(":")
      if(styles.length is 2)
        # if background-color
        if styles[0].indexOf('-') >=0
          this.style[util.convertStyle styles[0]] = styles[1]
        # if background
        else
          this.style[styles[0]] = styles[1]
      else
        throw new Error("please checkout your css")

  module.exports=dom




  #resolve selector to class  for example #77=>id="77" .name => className="name"
  _resolveSelector = (selector)->
    # tagName,className,id=""
    # match tagSelector classSelector attrselector
    className=""
    id=""
    attributes=[]
    selectors= selector.match(/^\w*\b|\.\w*\b|\#\w*\b|\[\w*=?"?\w*\"?]/g)
    unless (/^\w*$/g).test(selectors[0])
      throw new Error("first place must be tagSelector")
    else
      tagName=selectors[0]
      for selector in selectors[1...]
        #resove class
        if (/^\.\w*$/g).test(selector)
          className=selector.replace(/^\./,'')
          attribute={
            name:"class"
            value:className
          }
          attributes.push(attribute)
          #resove id
        else if (/^#\w*$/g).test(selector)
          id = selector.replace(/^#/,'')
          attribute={
            name:"id"
            value:id
          }
          attributes.push(attribute)
          #resove attr
        else if (/^\[\w*=?"?\w*\"?]$/).test(selector)
          selector=selector.replace(/["\[\]]/g,"")
          attrSelector =selector.split("=")
          attribute={
            name:attrSelector[0]
            value:attrSelector[1]||""
          }
          attributes.push(attribute)
    [tagName,className,id,attributes]
