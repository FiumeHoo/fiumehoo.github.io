---
layout: post
title: JS小知识 - Number
date:   2018-07-25 15:32:00 +0800
category: Javascript
tags: number
---

### 1. string强制转换为数字
- 可以使用`*1`来转换为数字
- 也可以使用`+`来转换为数字

``` javascript
'32' * 1 // 32
+ '123' // 123
```

### 2. 取整 `| 0`
对一个数字`|0`可以取整，负数也同样适用

``` javascript
1.3 | 0 // 1
-1.9 | 0 // -1
```

### 3. 判断奇偶数 `& 1`
对一个数字`& 1`可以判断奇偶数，负数也同样适用

``` javascript
const num = 3
!!(num & 1) // true
!!(num % 2) // true
```

### 4. 四舍五入到指定小数位数
使用科学计数法和模板字符串
``` javascript
const round = (n, decimals = 0) => Number(`${Math.round(`${n}e${decimals}`)}e-${decimals}`)
round(1.345, 2) // 1.35, 1.345e2 = 134.5, 135e-2 = 1.35
round(1.345, 1) // 1.3
```

### 5. 数字补0操作
当需要把一位数字显示成两位的时候，可以使用补0操作，如（2018.07.01）
``` javascript
const addZero1 = (num, len = 2) => (`0${num}`).slice(-len)
const addZero2 = (num, len = 2) => (`${num}`).padStart(lend, '0')
```
