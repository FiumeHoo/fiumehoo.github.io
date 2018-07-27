---
layout: post
title: JS小知识 - Function
date:   2018-07-25 17:31:00 +0800
category: Javascript
tags: function
---

### 1. 函数默认值
传入参数为`undefined`或者不传入的时候会使用默认参数，但是传入`null`会覆盖默认参数。
``` javascript
func = (1, m = 3, n = 4) => (1 * m * n)
func(2) // 24
```

### 2. 隐式返回值
返回值是用来返回函数最终结果的关键字，只有一个语句的箭头函数，可以隐式返回结果（函数必须省略大括号）。

``` javascript
function calcCircumference(diameter) {
    return Math.PI * diameter
}
// 简写为
calcCircumference = diameter => (Math.PI * diameter)
```

### 3. 惰性载入函数
在某个场景下函数中有判断语句，这个判断依据在整个项目运行期间一般不会变化，所以判断分支在整个项目运行期间只会运行某个特定分支，那么久可以考虑惰性载入函数

``` javascript
function foo() {
    if (a !== b) {
        console.log('a')
    } else {
        console.log('b')
    }
}

// 优化后
function foo() {
    if (a != b) {
        foo = function() {
            console.log('a')
        }
    } else {
        foo = function() {
            console.log('b')
        }
    }
    return foo()
}
```
第一次运行后会覆写这个方法，下次再运行的时候就不会执行判断了。
> 不太知道这种要用在什么地方

### 4. 代码复用
``` javascript
// 一个普通的验证函数
function validate(obj) {
    if (!obj.first) return false
    if (!obj.last) return false
    return true
}

console.log(validate({first: 'Bruce', last: 'Wayne'})) // true

// 修改后的通用验证函数
// 验证规则
const schema = {
    first: {
        required: true
    },
    last: {
        required: true
    }
}
// 验证函数
const validate = (schema, obj) => {
    for (field in schema) {
        if (schema[field].required) {
            if (!obj[field]) {
                return false
            }
        }
    }
    return true
}

console.log(validate(schema, {first: 'Bruce'})) // false
console.log(validate(schema, {first: 'Bruce', last: 'Wayne'})) // true
```

### 5. 四舍五入到指定小数位数
使用科学计数法和模板字符串
``` javascript
const round = (n, decimals = 0) => Number(`${Math.round(`${n}e${decimals}`)}e-${decimals}`)
round(1.345, 2) // 1.35, 1.345e2 = 134.5, 135e-2 = 1.35
round(1.345, 1) // 1.3
```
