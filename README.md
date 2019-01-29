

# Peony Circle 圆形环

## 概述

> A Vue Gradient Progress Circle Component(一个vue的可渐变的进度圆环组件)

图表类组件。一般有两种用途：
* 显示某项任务进度的百分比；
* 统计某些指标的占比。

## Install(安装)

You can install it via NPM:(您可以通过NPM安装它)

``` bash
npm install --save peony-circle
```

or,just include `peony-circle.js` to your view like this.(或者使用引用peony-circle.js的方式)

Namely(即)：

``` js
import PeonyCircle from 'peony-circle'
// 或者 const PeonyCircle = require('peony-circle')
// 或者 <script src="..."></script>
Vue.use(PeonyCircle)
```

## Usage(使用)

``` html
<template lang="html">
  <peony-circle :size="120" :stroke-width="6" :trail-width="6" :percent="percent" :stroke-color="strokeColor" :trail-color="trailColor">
    <span style="color:#36D1DC">{{ percent }}%</span>
  </peony-circle>
</template>

<script>
export default {
  data () {
    return {
      percent: 20,
      strokeColor: ['#36D1DC', '#5B86E5'],
      trailColor: '#ececec'
    }
  }
}
</script>
```

##result

![run-result.gif](https://upload-images.jianshu.io/upload_images/4645892-e75a692211acc1aa.gif?imageMogr2/auto-orient/strip)

## Attributes(属性)

| 参数      | 说明    | 类型      | 可选值       | 默认值   |
|---------- |-------- |---------- |-------------  |-------- |
| percent  | 进度百分比    | Number   | 0-100 | 0 |
| size  | 圆环的宽高大小    | Number   | - | - |
| strokeLinecap  | 定义不同类型的开放路径的终结    | String   | butt\round\square | butt |
| strokeWidth  | 圆形环的线条宽度    | Number   | - | 1 |
| strokeColor  | 线条颜色，数组时表示渐变    | Array, String   | - | #3FC7FA |
| anticlockwise  | 是否按逆时针方向展示百分比    | Boolean   | true\false | false |

## Events

none

## slot

| 名称      | 说明    |
|---------- |-------- |
| none  | 自定义显示中间内容，内容默认垂直居中    |

## run(运行)

``` bash
# git clone ...
git clone https://github.com/nongshuqiner/peony-circle.git

# enter
cd peony-circle

# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```

## Donation

If you find component useful, you can buy me a cup of coffee
如果您发现此组件有用，您可以给我买一杯咖啡

![payment-code.png](https://upload-images.jianshu.io/upload_images/4645892-20338f9a0a443ff2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## Contact me(联系我)

Just Contact Me At:
- Email: ym1185509297@163.com
- 简书: [言墨儿](https://www.jianshu.com/u/319464da1cc1)

## License

[MIT](http://opensource.org/licenses/MIT)
Copyright (c) 2018 - forever Naufal Rabbani
