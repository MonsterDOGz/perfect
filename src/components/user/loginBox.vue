<template>
  <div ref="box" class="loginBox" style="display:none;">
    <div class="msgbox">
      <div class="closeBox" @click="closebox">
        <span></span>
      </div>
      <div class="bodyBox">
        <div class="userLog">
          <h6>账号登录</h6>
          <div class="logBox">
            <div class="loginTip" ref="tipBox" style="display:none;">{{tip}}</div>
            <p>
              <input type="text" placeholder="账号" size="15" maxlength="50" class="username" v-model="uphone">
              <span class="clearUsername" v-show="clear" @click="clearUsername"></span>
            </p>
            <p>
              <input type="password" size="15" maxlength="16" placeholder="密码" class="password" v-model="upwd">
            </p>
            <p>
              <input type="button" value="登录" class="loginBtn" @click="butLogin">
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations } from 'vuex'
export default {
  inject: ['reload'],
  data () {
    return {
      uphone: '',
      upwd: '',
      tip: '',
      cartInfo: ''
    }
  },
  computed: {
    clear () {
      let bool
      if (this.uphone) {
        bool = true
      } else {
        bool = false
      }
      return bool
    }
  },
  mounted () {
    this.login()
  },
  methods: {
    closebox () {
      this.$refs.box.style.cssText = 'display:none;'
    },
    login () {
      this.changeLogin(this.$refs.box)
    },
    clearUsername () {
      this.uphone = null
    },
    tipBox () {
      this.$refs.tipBox.style.cssText = 'display:block;'
    },
    butLogin () {
      var reg = /^1[3-8]\d{9}$/
      if (!reg.test(this.uphone)) {
        this.tip = '请输入正确的手机号'
        this.tipBox()
        return
      } else if (this.upwd === '') {
        this.tip = '密码格式不正确'
        this.tipBox()
        return
      }
      var url = `/api/user/login?uphone=${this.uphone}&upwd=${this.upwd}`
      this.axios.get(url).then(result => {
        if (result.data.code === -1) {
          this.tip = '手机号或密码错误'
          this.tipBox()
        } else {
          localStorage.setItem('uid', result.data.data[0].uid)
          this.inquire()
          // this.getUserInfo(result.data.data[0])
          this.reload()
          // this.$router.push({path: '/'})
        }
      })
    },
    inquire () {
      var url = `/api/cart/inquireCart?uid=${localStorage.uid}`
      this.axios.get(url).then(result => {
        if (result.data.data) {
          this.cartInfo = result.data.data
          for (let i = 0; i < this.cartInfo[0].length; i++) {
            this.cartInfo[0][i].pic = this.cartInfo[0][i].pic.split(',')
          }
        }
      })
    },
    ...mapMutations(['changeLogin'])
  }
}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
  .loginBox
    .msgbox
      position fixed
      z-index 9999
      left 50%
      top 50%
      background-color #fff
      width 500px
      height 323px
      box-shadow rgba(0,0,0,0.8) 0px 5px 16px
      transform translate(-50%,-50%)
      border 1px solid rgb(151,151,151)
      .closeBox
        height 50px
        border-top 3px solid rgb(220,73,73);
        background url(/staticimg/c_line.png) no-repeat 572px 0px
        span
          float right
          width 46px
          height 20px
          cursor pointer
          border-bottom-left-radius 3px
          border-bottom-right-radius 3px
          background url(/staticimg/closebox.png) no-repeat center center
          &:hover
            background url(/staticimg/closebox_hover.png) no-repeat center center rgb(220,73,73)
      .bodyBox
        height 270px
        background-color #fff
        .userLog
          width 290px
          margin 0 auto
          h6
            color #999
            font-size 14px
            width 249px
            margin 0 auto
          .logBox
            padding-top 35px
            position relative
            width 249px
            margin 0 auto
            .loginTip
              color #ff4c4c
              font-size 12px
              border 1px solid #ffbdbf
              border-radius 5px
              width 217px
              min-height 30px
              line-height 20px
              background url(/staticimg/mbwrong.png) no-repeat 10px center #ffebec
              padding 5px 0 0 30px
              position absolute
              left 0
              top 10px
              z-index 1
              &:after
                content ''
                position absolute
                background url(/staticimg/sjts.png) no-repeat
                width 14px
                height 6px
                left 22px
                bottom -6px
            p
              padding-bottom 12px
              position relative
              .username
                background url(/staticimg/user_1.png) no-repeat 10px center
                color #666
                padding 1px 30px 1px 35px
                width 182px
                height 40px
                border 1px solid #ddd
                border-radius 5px
                line-height 40px
                outline none
                &:focus
                  border-color #bababa
              .clearUsername
                position absolute
                right 10px
                top 12px
                background url(/staticimg/clearusername.png) no-repeat
                width 20px
                height 20px
                cursor pointer
              .password
                background url(/staticimg/password.png) no-repeat 10px center
                clor #999
                padding-right 10px
                width 202px
                height 40px
                border 1px solid #ddd
                border-radius 5px
                padding-left 35px
                line-height 40px
                outline none
                &:focus
                  border-color #bababa
              .loginBtn
                background-color #ff4c4c
                width 142px
                height 36px
                border 0 none
                outline none
                border-radius 3px
                color #fff
                font-size 16px
                font-weight bold
                margin 10px 0 0 50px
                padding 1px 6px
                cursor pointer
                &:hover
                  background-color #ff2c2c
</style>
