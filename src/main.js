// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import 'element-ui/lib/theme-chalk/index.css'
import ElementUI from 'element-ui'
import axios from 'axios'
// import store from './store'

Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.prototype.axios = axios
/* eslint-disable no-new */
// 跳转页面回到页面顶部
router.afterEach((to, from, next) => {
  window.scrollTo(0, 0)
})
new Vue({
  el: '#app',
  router,
  // store,
  components: { App },
  template: '<App/>'
})
