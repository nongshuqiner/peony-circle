import Vue from 'vue'
import App from './App.vue'

import PeonyCircle from './index.js'
Vue.use(PeonyCircle)

new Vue({
  el: '#app',
  render: h => h(App)
})
