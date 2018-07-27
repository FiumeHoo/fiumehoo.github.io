---
layout: post
title: JS小知识 - Object
date:   2018-07-27 17:06:00 +0800
category: Javascript
tags: object
---

### 1. 使用解构删除不必要的属性
有时候因为某些对象包含敏感信息或是仅仅因为太大了，不希望保留该对象的某些属性时，可以简单的将这些无用的属性赋值给变量，保留有用的部分作为剩余参数就可以了。

例：删除_internal和tooBig参数
``` javascript
var obj1 = {
    el1: '1',
    el2: '2',
    el3: '3',
    _internal: 'secret',
    tooBig: {}
}

var {_internal, tooBig, ...cleanObj} = obj1
console.log(cleanObj)
```

### 2. 在函数参数中解构嵌套对象
```javascript
var car = {
    model: 'bmw 2018',
    engine:{
        v6: true,
        turbo: true,
        vin: 12345
    }
}

const modelAndVin = ({model, engine: {vin}}) => {
    console.log(`model: ${model} vin: ${vin}`)
}

modelAndVin(car) // model: bmw 2018 vin: 12345
```
