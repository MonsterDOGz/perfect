<template>
    <div class="header">
        <div class="header_top">
            <div class="wrap">
                <span class="welcome">欢迎来到完美世界周边商城！</span>
                <div class="header_cart" v-on:mouseover="cartShow()" v-on:mouseout="cartHide()">
                    <router-link :to="'/cart'" ref="cartTitle" class="text">
                        <span class="icon"></span>
                        购物车（<span class="cartNum">{{number}}</span>）
                    </router-link>
                    <div class="cart_list" ref="cartHidden" style="height:0px;transition:0.4s;">
                        <p class="list_null" style="display:none;">购物车还没有商品，快去挑选商品吧！</p>
                        <div class="list">
                            <div class="shop_list">
                                <ul>
                                    <li v-for="(item,index) of cart" :key="index">
                                        <a href="javascript:;" :click='`jump(${item.pid})`'>
                                            <img :src="'/api/'+item.pic[0]">
                                            <p class="title">
                                                <span class="name">{{item.pname}}</span>
                                                <span class="size">款式：{{item.style}}</span>
                                            </p>
                                            <p class="num">{{item.price}} x {{item.num}}</p>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="shop_result">
                                <div class="shop_left">
                                    <div class="left">
                                        <p calss="num">
                                            共<span class="cartNum"> {{number}} </span>件商品
                                        </p>
                                        <p class="total">
                                            ￥<span>{{allPrice}}.00</span>
                                        </p>
                                    </div>
                                    <router-link :to="'/cart'" class="right">去购物车结算</router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="user_info">
                    <li class="first_li"><a href="javascript:;">我的订单</a></li>
                    <li><a href="javascript:;">我的关注</a></li>
                </ul>
                <ul class="user_info" v-show="!isLogin">
                    <li class="first_li" @click="phoneLogin"><a href="javascript:;">登录</a></li>
                    <li><a href="javascript:;">注册</a></li>
                </ul>
                <ul class="user_info" v-show="isLogin">
                    <li class="first_li">
                        <span>
                            <a href="javascript:;">15256943949，</a>
                            <a href="javascript:;" @click="outLogin">退出</a>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="header_nav">
            <div class="wrap">
                <router-link :to="'/'" class="logo_wm">
                    <img src="/staticimg/logo_wm.png" title="完美商城">
                </router-link>
                <router-link :to="'/'" class="logo_shop">
                    <img src="/staticimg/logo_shop.png" alt="完美商城">
                </router-link>
                <!-- 导航菜单 -->
                <div class="all_wares">
                    <p class="text">
                        <span></span>全部商品
                    </p>
                    <ul class="wares">
                        <li>
                            <a href="javascript:;" class="ellipsis2" title="DOTA2神秘商店">
                                DOTA2神秘商店<em></em>
                            </a>
                            <ul class="wares_item">
                                <li><a href="javascript:;">手办扭蛋</a></li>
                                <li><a href="javascript:;">创意T恤</a></li>
                                <li><a href="javascript:;">焕新服饰</a></li>
                                <li><a href="javascript:;">生活用品</a></li>
                                <li><a href="javascript:;">毛绒合辑</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;" class="ellipsis2" title="完美世界周边">
                                完美世界周边<em></em>
                            </a>
                            <ul class="wares_item">
                                <li><a href="javascript:;">梦间集周边</a></li>
                                <li><a href="javascript:;">诛仙3专区</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;" class="ellipsis2" title="CSGO正版周边">
                                CSGO正版周边<em></em>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;" class="ellipsis2" title="姜小虎周边">
                                姜小虎周边<em></em>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;" class="ellipsis2" title="游戏外设">
                                游戏外设<em></em>
                            </a>
                            <ul class="wares_item">
                                <li><a href="javascript:;">键盘</a></li>
                                <li><a href="javascript:;">鼠标</a></li>
                                <li><a href="javascript:;">耳机</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <ul class="nav">
                    <li><router-link :to="'/'">首页</router-link></li>
                    <li><a href="javascript:;">完美世界周边</a></li>
                    <li><a href="javascript:;">DOTA2专区</a></li>
                    <li><a href="javascript:;">FAQ</a></li>
                </ul>
                <div class="header_search">
                    <form class="cf">
                        <input type="text" class="text">
                        <input type="button" class="btn">
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {mapMutations, mapState} from 'vuex'
export default {
  inject: ['reload'],
  data () {
    return {
      activeIndex: '1',
      cart: '',
      number: 0,
      allPrice: 0
    }
  },
  computed: {
    isLogin () {
      let bool
      if (!localStorage.uid) {
        bool = false
      } else {
        bool = true
      }
      return bool
    },
    ...mapState(['cartInfo'])
  },
  watch: {
    cartInfo: {
      handler () {
        this.cart = this.$store.state.cartInfo[0]
        this.number = this.$store.state.cartInfo[1]
        this.allPrice = this.$store.state.cartInfo[2]
      },
      immediate: true
    }
  },
  methods: {
    cartShow () {
      if (this.cart) {
        this.$refs.cartHidden.style.cssText = `height:${84 + 99 * this.cart.length}px;transition:0.4s;`
      }
    },
    cartHide () {
      this.$refs.cartHidden.style.cssText = 'height:0px;transition:0.4s;'
    },
    handleSelect (key, keyPath) {
      console.log(key, keyPath)
    },
    phoneLogin () {
      this.$store.state.loginBox.style.cssText = 'display:block;'
    },
    outLogin () {
      localStorage.clear()
      if (this.$route.name !== 'IndexHome') {
        this.$router.push({path: '/'})
        this.outLog()
        this.reload()
      } else {
        this.outLog()
        this.reload()
      }
    },
    jump (pid) {
      this.$router.push({
        path: '/products/' + pid
      })
    },
    ...mapMutations(['outLog'])
  }
}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
.header
    position relative
    z-index 3
    .header_top
        height 33px
        background-color #474747
        color #ccc
        .wrap
            width 1190px
            margin 0 auto
            .welcome
                margin-top 7px
                float left
                cursor default
            .header_cart
                width 138px
                position relative
                z-index 2
                float right
                &:hover .text
                    background-color #e32332
                    color #fff
                &:hover .text .icon
                    background-position -164px -38px
                &:hover .text .cartNum
                    color #fff
                .text
                    height 33px
                    line-height 33px
                    background-color #1e1e1e
                    text-align center
                    display block
                    .icon
                        display inline-block
                        margin-right 8px
                        width 20px
                        height 14px
                        overflow hidden
                        background url(/staticimg/base.png) -164px -20px
                        vertical-align -2px
                    .cartNum
                        color #db313e
                        font-weight bold
                .cart_list
                    position absolute
                    top 33px
                    right 0
                    width 350px
                    background-color #fafafa
                    z-index 1
                    box-shadow 0 2px 3px #ccc
                    overflow hidden
                    transition 0.4s
                    .list_null
                        padding 49px 0 37px 0
                        text-align center
                        font-size 14px
                        color #666
                    .list
                        text-align center
                        font-size 12px
                        color #666
                        .shop_list
                            position relative
                            top 0
                            left 0
                            padding 17px 17px 0 17px
                            max-height 400px
                            background-color #fff
                            ul
                                li
                                    overflow hidden
                                    position relative
                                    padding 13px 5px 3px 5px
                                    border-top 1px solid #e0e0e0
                                    a
                                        display inline-block
                                        padding-bottom 10px
                                        width 100%
                                        &:hover .title .name
                                            color #e90404
                                        img
                                            margin-right 10px
                                            border 1px solid #ddd
                                            width 50px
                                            height 50px
                                            float left
                                        .title
                                            width 100px
                                            padding-right 15px
                                            float left
                                            text-align left
                                            .name
                                                color #666
                                                display block
                                                max-height 32px
                                                overflow hidden
                                            .size
                                                color #999
                                                display block
                                                max-height 18px
                                                overflow hidden
                                        .num
                                            color #474747
                                            float right
                        .shop_result
                            padding 22px 17px 15px 17px
                            color #666
                            &:after
                                clear()
                            .shop_left
                                .left
                                    float left
                                    text-align left
                                    .num
                                        .cartNum
                                            padding 0 3px
                                            color #474747
                                    .total
                                        font-size 24px
                                        color #e90404
                                .right
                                    width 132px
                                    height 40px
                                    line-height 40px
                                    text-align center
                                    background-color #e32332
                                    font-size 14px
                                    color #fff
                                    float right
                                    &:hover
                                        background-color #c00
            .user_info
                margin 11px 35px 0 0
                float right
                li
                    float left
                    padding 0 7px
                    height 11px
                    line-height 11px
                    border-left 1px solid #666
                .first_li
                    border-left none
                a
                    display inline-block
                    color #ccc
                    transition 0.2s
                    &:hover
                        color #fff
    .header_nav
        height 101px
        background-color #fff
        border-bottom 3px solid #de2f3c
        .wrap
            width 1190px
            margin 0 auto
            .logo_wm
                width 183px
                text-align center
                height 72px
                padding-top 29px
                background-color #c20315
                margin-bottom -3px
                display block
                float left
                img
                    width 120px
                    height 41px
            .logo_shop
                margin 37px 0 0 34px
                display block
                float left
            .all_wares
                position relative
                width 175px
                margin-left 50px
                text-indent 19px
                z-index 1
                float left
                &:hover .wares
                    display block
                    z-index 9999
                &:hover .text
                    background-color #e32331
                    color #fff
                &:hover .text span
                    background-position -39px 0
                .text
                    height 101px
                    line-height 101px
                    font-size 15px
                    cursor pointer
                    span
                        display inline-block
                        width 15px
                        height 13px
                        margin-right 7px
                        background url(/staticimg/base.png) no-repeat -24px 0
                        vertical-align -1px
                .wares
                    display none
                    position absolute
                    top 101px
                    left 0
                    float left
                    padding-bottom 10px
                    width 100%
                    font-size 14px
                    background-color #fff
                    box-shadow 0 2px 3px #ccc
                    li
                        position relative
                        &:hover .wares_item
                            height 200px
                            transition 0.3s ease-in
                        .ellipsis2
                            display block
                            width 155px
                            padding-right 20px
                            height 40px
                            line-height 40px
                            background-color #fff
                            color #474747
                            position relative
                            overflow hidden
                            &:hover
                                background-color #f5f5f5
                                color #e90404
                            &:hover em
                                background-position -60px 0
                            em
                                position absolute
                                top 15px
                                right 10px
                                width 6px
                                height 10px
                                overflow hidden
                                background url(/staticimg/base.png) no-repeat -54px 0
                        .wares_item
                            overflow hidden
                            height 0px
                            padding-top 0px
                            margin-top 0px
                            padding-bottom 0px
                            margin-bottom 0px
                            position absolute
                            top 0
                            left 175px
                            li
                                &:hover a
                                    background-color #fff
                                a
                                    display block
                                    width 155px
                                    padding-right 20px
                                    height 40px
                                    line-height 40px
                                    background-color #f5f5f5
                                    color #474747
                                    position relative
            .nav
                margin-top 40px
                float left
                li
                    float left
                    padding 0 15px
                    font-size 15px
                    a
                        color #474747
                        transition 0.2s
                        &:hover
                            color #e90404
            .header_search
                position relative
                width 320px
                height 41px
                margin-top 30px
                z-index 1
                float right
                .cf
                    .text
                        float left
                        width 263px
                        height 39px
                        line-height 39px
                        padding 0 5px
                        border 1px solid #ccc
                        border-right none
                        outline none
                        font-size 14px
                    .btn
                        float right
                        width 46px
                        height 41px
                        border 0
                        background #e32332 url(/staticimg/search.png) no-repeat 50%
</style>
