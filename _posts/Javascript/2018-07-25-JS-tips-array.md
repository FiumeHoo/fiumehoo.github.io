---
layout: post
title: JS小知识 - Array
date:   2018-07-25 16:33:00 +0800
category: Javascript
tags: array
---


### 1. 使用Boolean过滤数组中的所有假值
JS中有一些假值：`false`, `null`, `0`, `undefined`, `NaN`, 使用Boolean构造函数可以快速过滤掉假值

``` javascript
const compact = arr => arr.filter(Boolean)
compact([0, 1, false, 2, '', 3, 'a', 'e' * 23, NaN]) // [1, 2, 3, 'a']
```


### 2. reduce 用法示例

#### 2.1 同时实现map和filter
假如有一个数组，现在需要更新它的每一项(map)，然后筛选出一部分(filter)。
例：将下面数组中的值翻倍，然后挑选出大于50的数

``` javascript
const arr = [10, 20,30, 40]
const doubledOver50 = arr.reduce((finalList, num) => {
    num = num * 2
    if (num > 50) {
        finalList.push(num)
    }
    return finalList
}, [])

console.log(doubledOver50) // [60, 80]
```

#### 2.2 统计数组中相同项的个数

``` javascript
const data = ['car', 'car', 'truck', 'truck', 'bike', 'walk', 'car', 'van', 'bike', 'walk', 'car', 'van', 'car', 'truck', 'pogostick']

const transportation = data.reduce(function(obj, item) {
    if (!obj[item]) {
        obj[item] = 0
    }
    obj[item]++
    return obj
}, {})

console.log(transportation) // { car: 5, truck: 3, bike: 2, walk: 2, van: 2, pogostick: 1 }

// 另一种更简洁的写法
const transportation = data.reduce(function(obj, item) {
  obj[item] = obj[item] ? ++obj[item] : 1
  return obj
}, {})
```

#### 2.3 累加，关联

``` javascript
// 当前购物车清单
var items = [
    {price: 10},
    {price: 120},
    {price: 1000}
]
// 计算总价
var total = items.reduce(function(sumSoFar, nextPrice) {
    return sumSoFar + nextPrice.price
}, 0)
```

#### 2.4 结合

沿用上例

``` javascript
// 创建一个可以计算不同货币的总价的reducer函数
var reducers = {
    totalInDollar: function(state, item) {
        state.dollars += item.price
        return state
    },
    totalInEuros: function(state, item) {
        state.euros += item.price + 0.897424392
        return state
    },
    totalInPounds: function(state, item) {
        state.pounds += item.price * 0.692688671
        return state
    },
    totalInYen: function(state, item) {
        state.yens += item.price * 113.852
        return state
    }
}

// 然后创建一个函数，能够调用每一部分的reduce函数，返回一个新的reducer回调函数
var combineTotalPriceReducers = function(reducers) {
    return function(state, item) {
        return Object.keys(reducers).reduce(function(nextState, key) {
            reducers[key](state, item)
            return state
        }, {})
    }
}

// 现在来使用这个函数
var bigTotalPriceReducer = combineTotalPriceReducers(reducers)
var initialState = {dollars: 0, euros: 0, yens: 0, pounds: 0}
var totals = items.reduce(bigTotalPriceReducer, initialState)
```


### 3. map 用法示例

``` javascript
const inventors = [
  { first: 'Albert', last: 'Einstein', year: 1879, passed: 1955 },
  { first: 'Isaac', last: 'Newton', year: 1643, passed: 1727 },
  { first: 'Galileo', last: 'Galilei', year: 1564, passed: 1642 },
  { first: 'Marie', last: 'Curie', year: 1867, passed: 1934 },
  { first: 'Johannes', last: 'Kepler', year: 1571, passed: 1630 },
  { first: 'Nicolaus', last: 'Copernicus', year: 1473, passed: 1543 },
  { first: 'Max', last: 'Planck', year: 1858, passed: 1947 },
  { first: 'Katherine', last: 'Blodgett', year: 1898, passed: 1979 },
  { first: 'Ada', last: 'Lovelace', year: 1815, passed: 1852 },
  { first: 'Sarah E.', last: 'Goode', year: 1855, passed: 1905 },
  { first: 'Lise', last: 'Meitner', year: 1878, passed: 1968 },
  { first: 'Hanna', last: 'Hammarstr枚m', year: 1829, passed: 1909 }
]

const fullNames = inventors.map(inventor => `${inventor.first} ${inventor.last}`)
```


### 4. sort 用法示例

``` javascript
// 沿用上例的inventors数组
// 按出生日期排序
const ordered = inventors.sort((a, b) => a.year > b.year ? 1 : -1)

// 按年龄排序
const oldest = inventors.sort(function(a, b) {
    const lastInventor = a.passed - a.year
    const nextInventor = b.passed - b.year
    return lastInventor > nextInventor ? -1 : 1
})
```

### 5. some 和 every 用法示例

``` javascript
const people = [
  { name: 'Wes', year: 1988 },
  { name: 'Kait', year: 1986 },
  { name: 'Irv', year: 1970 },
  { name: 'Lux', year: 2015 },
]

const isAdult = people.some(person => (new Date().getFullYear() - person.year >= 19))
const allAdults = people.every(person -> (new Date().getFullYear() - person.year >= 19))
```

### 6. find 和 findIndex 用法示例

``` javascript
const comments = [
  { text: 'Love this!', id: 523423 },
  { text: 'Super good', id: 823423 },
  { text: 'You are the best', id: 2039842 },
  { text: 'Ramen is my fav food ever', id: 123523 },
  { text: 'Nice Nice Nice!', id: 542328 }
]

const comment = comments.find(comment => comment.id === 823423)
const index = comments.findIndex(comment => comment.id === 823423)
```

### 7. 数组去重
``` javascript
const arr = [...new Set([1, 2, 3, 3])]
```

### 8. 用数组建立一个简单的循环
当需要不停的循环数组的元素时，比如一组旋转的图片，或音乐播放列表，可以使用以下方法使一个数组拥有循环能力：

``` javascript
var list = ['A', 'B', 'C', 'D', 'E']

function makeLooper(arr) {
    arr.loopIdx = 0
    arr.current = function() {
        if (this.loopIdx < 0) {
            this.loopIdx = this.length - 1
        }

        if (this.loopIdx >= this.length) {
            this.loopIdx = 0
        }

        return arr[this.loopIdx]
    }

    arr.next = function()  {
        this.loopIdx++
        return this.current()
    }

    arr.prev = function() {
        this.loopIdx--
        return this.current()
    }
}

makeLooper(list)

list.current()
list.next()
list.prev()

// 使用取模操作符 % 更优雅
function makeLooper(arr) {
    arr.loopIdx = 0
    arr.current = function() {
        this.loopIdx = this.loopIdx % this.length // this.loopIdx < this.length时，余数是this.loopIdx自己，this.loopIdx = this.length时，余数是0
        return arr[this.loopIdx]
    }

    arr.next = function() {
        this.loopIdx++
        return this.current()
    }

    arr.prev = function() {
        this.loopIdx += this.length - 1
        return this.current()
    }
}
```

### 9. 将数组平铺到指定深度

``` javascript
const flatten = (arr, depth = 1) => // 箭头符号后可以使用()或省略，不能使用{}
  depth != 1
    ? arr.reduce((a, v) => a.concat(Array.isArray(v) ? flatten(v, depth - 1) : v), [])
    : arr.reduce((a, v) => a.concat(v), [])

flatten([1, [2], 3, 4]) // [ 1, 2, 3, 4 ]
flatten([1, [2, [3, [4, 5], 6], 7], 8], 2) // [ 1, 2, 3, [ 4, 5 ], 6, 7, 8 ]
```
