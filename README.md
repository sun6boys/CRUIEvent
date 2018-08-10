
# CRUIEvent

超轻量级基于Responder Chain的UI事件响应框架，用来实现“发布-订阅”的UI事件通信模式

## 前言

现实开发中我们经常会碰到层级比较深的UI形式，如下图：`First View`、`Second View`、`Third View`均是自定义View

![](https://github.com/sun6boys/CRUIEvent/blob/master/ImageSources/image1.jpg?raw=true)|![](https://github.com/sun6boys/CRUIEvent/blob/master/ImageSources/image2.jpg?raw=true)
:---------------------:|:---------------------:

> 场景1: 是Third View上有一个Button，点击后Controller需要push到一个新的Controller

一般情况下我们有大概这样几种方式做到事件传递**<对象间的交互方式>**

- delegate
- block
- Notification
- KVO
- Target-Action
- ...

### Delegate
delegate是一种一对一的交互方式，通常用在2个能够建立关系的对象之间，这里显然Third View和Controller中间相隔了Second View 和 First View，很难直接和Controller建立联系。

|  | Third View | Second View | First View | Controller's View | Controller|UIWindow | UIApplication| Appdelegate|
| ------------- |:-------------:| -----:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|
| Next Responder | right-aligned | $1600 |


