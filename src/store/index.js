import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
export default new Vuex.Store({
  state: {
    // 用户登录盒子
    loginBox: ''
  },
  mutations: {
    // 当前用户退出后删除信息
    // outLogin (state) {
    //   state.userInfo = ''
    // },
    // 登录盒子
    changeLogin (state, data) {
      state.loginBox = data
    }
  }
})
