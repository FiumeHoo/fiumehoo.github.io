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

