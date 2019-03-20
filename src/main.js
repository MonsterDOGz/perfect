// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import 'element-ui/lib/theme-chalk/index.css'
import ElementUI from 'element-ui'
import axios from 'axios'
import store from './store'
import './assets/font_1078987_3bgv3vwmkzj/iconfont.css'

Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.prototype.axios = axios
/* eslint-disable no-new */
// 跳转页面回到页面顶部
router.afterEach((to, from, next) => {
  window.scrollTo(0, 0)
})

Vue.filter('myCurrency', function (myInput, arg) {
  let result = arg + myInput
  return result
})

new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
