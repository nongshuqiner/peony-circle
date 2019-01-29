<template>
  <div class="peony-circle" :style="circleSize">
    <svg viewBox="0 0 100 100">
      <!-- 渐变 -->
      <defs v-if="isGradient">
        <linearGradient id="peony-circle__gradient" x1="10%" y1="45%" x2="50%" y2="0%">
          <stop offset="0%" :style="{'stop-color': strokeColor[0], 'stop-opacity': 1}"/>
          <stop offset="100%" :style="{'stop-color': strokeColor[1], 'stop-opacity': 1}"/>
        </linearGradient>
      </defs>
      <!-- 默认的底层线条 -->
      <path :d="pathString" :stroke="trailColor" :stroke-width="trailWidth" :fill-opacity="0"/>
      <!-- 进度线条 -->
      <path :d="pathString" :stroke="isGradient ? 'url(#peony-circle__gradient)' : strokeColor" :stroke-width="strokeWidth"
        :stroke-linecap="strokeLinecap" fill-opacity="0" :style="pathStyle"
      />
    </svg>
    <div class="peony-circle__content">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PeonyCircle',
  props: {
    percent: { type: Number, default: 0 }, // 进度百分比
    size: Number, // 大小
    strokeLinecap: { type: String, default: 'butt' }, // svg path stroke-linecap 属性: 定义不同类型的开放路径的终结 butt round square
    strokeWidth: { type: Number, default: 1 }, // 线条宽度
    strokeColor: { type: [Array, String], default: '#3FC7FA' }, // 线条颜色，数组时表示渐变
    trailWidth: { type: Number, default: 1 }, // 背景线条宽度
    trailColor: { type: String, default: '#D9D9D9' }, // 背景线条颜色
    anticlockwise: { type: Boolean, default: false } // 是否按逆时针方向展示百分比
  },
  computed: {
    circleSize () { // 大小
      if (this.size) {
        return { width: `${this.size}px`, height: `${this.size}px` }
      } else {
        return {}
      }
    },
    radius () {
      return 50 - this.strokeWidth / 2
    },
    pathString () {
      return `M 50,50 m 0,-${this.radius}
      a ${this.radius},${this.radius} 0 1 1 0,${2 * this.radius}
      a ${this.radius},${this.radius} 0 1 1 0,-${2 * this.radius}`
    },
    len () {
      return Math.PI * 2 * this.radius
    },
    pathStyle () {
      return {
        'stroke-dasharray': `${this.len}px ${this.len}px`,
        'stroke-dashoffset': `${((this.anticlockwise ? this.percent - 100 : 100 - this.percent) / 100 * this.len)}px`,
        'transition': 'stroke-dashoffset 0.6s ease 0s, stroke 0.6s ease'
      }
    },
    isGradient () { // 是否渐变
      return typeof this.strokeColor !== 'string'
    }
  }
}
</script>
