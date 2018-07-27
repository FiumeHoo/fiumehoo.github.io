---
layout: post
title: JS小知识 - Operators
date:   2018-07-25 15:33:00 +0800
category: Javascript
tags: operators
---

### 1. 双位运算符 ~~
可以使用双位运算符来代替`Math.floor()`，双位运算符的优势在于它的运行速度更快。

``` javascript
Math.floor(4.9) === 4 // true
~~4.9 === 4 // true
```

### 2. 短路求值 （逻辑与`&&`，逻辑或`||`）
短路求值，只有当第一个运算的值无法确定逻辑运算的结果时，才对第二个运算数进行求值。

``` javascript
let param1 = expr1 && expr2
let param2 = expr1 || expr2

// 可以用来设置默认值
let variable1
let variable2 = variable1 || 'foo'

// 也可以用来进行简单的判断，取代 if 语句
let variable = param && param.prop

let test = true
var isTrue = function() {
    console.log('Test is true')
}
var isFalse = function() {
    console.log('Test is false')
}
// 普通 if 语句
if (test) {
    isTrue()
}
// 上面的语句可以使用 && 写为：
test && isTrue()

test = false
if (!test) {
    isFalse()
}
test || isFalse()
```
