<template>
  <div class="cart">
    <div class="wrap">
      <div class="nav_bar">
        <router-link :to="'/'">首页</router-link>
        >
        <a href="javascript:;">我的购物车</a>
      </div>
      <div class="cart_null" v-show="!bool">
        <span></span>
        购物车空空的哦~，赶紧
        <router-link :to="'/'">去选购</router-link>
        吧！
      </div>
      <div class="cart_list" v-show="bool">
        <form>
          <table>
            <thead>
              <tr>
                <td class="state">
                  <!-- <span class="all_checkbox">
                    <span class="checkbox">
                      <label></label>
                    </span>
                    <span>全选</span>
                  </span> -->
                </td>
                <td class="name">商品名称</td>
                <td class="num">数量</td>
                <td class="prices">价格</td>
                <td class="operation">操作</td>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item,index) in cartList" :key="index">
                <td class="state">
                  <!-- <span class="checkbox">
                    <input type="checkbox" id="index" name="pids" value="1" v-model="checkedNames">
                    <label for="index">123</label>
                  </span> -->
                </td>
                <td>
                  <div class="cf">
                    <div class="cf_img">
                      <router-link :to="'/products/'+item.pid">
                        <img :src="'/api/'+item.pic[0]" :title="item.pname">
                      </router-link>
                    </div>
                    <div class="cf_name">
                      <h1 class="title">
                        <router-link :to="'/products/'+item.pid" :title="item.pname">{{item.pname}}</router-link>
                      </h1>
                      <p>款式：{{item.style}}</p>
                    </div>
                  </div>
                </td>
                <td>
                  <span class="number_input">
                    <span class="reduce" @click="reduce(item.pid, index)"></span>
                    <input type="text" ref="num" :value="item.num" min="1" maxlength="5">
                    <span class="plus" @click="plus(item.pid, index, item.stock)"></span>
                  </span>
                  <p class="stock">
                    库存
                    <font>{{item.stock}}</font>
                    件
                  </p>
                </td>
                <td class="price">
                  ￥
                  <font>{{item.price*item.num}}.00</font>
                </td>
                <td>
                  <a href="javascript:;" class="del" @click="delList(item.pid)">
                    <span></span>
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
          <div class="total_bar">
            <!-- <div class="f_left">
              <span class="all_checkbox">
                <span class="checkbox">
                  <label></label>
                </span>
                <span>全选</span>
              </span>
              <a href="javascript:;" class="batch_delete">删除选中的商品</a>
              <a href="javascript:;">继续购物</a>
            </div> -->
            <div class="f_right">
              <div class="f_right">
                <input type="button" value="去结算" class="btn_checkout">
                <p class="tip_checkout" style="display:none;">
                  请勾选需要结算的商品
                  <span></span>
                </p>
              </div>
              <p class="f_right">
                共
                <span class="num">
                  <font>{{number}}</font>
                </span>
                件商品，合计：
                <span>￥
                  <font class="checkoutPrice">{{allPrice}}.00</font>
                </span>
              </p>
            </div>
          </div>
        </form>
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
      checkedNames: '',
      cartInfo: '',
      cartList: [],
      number: 0,
      allPrice: 0,
      bool: ''
    }
  },
  methods: {
    reduce (pid, index) {
      if (this.$refs.num[index].value > 1) {
        let num = --this.$refs.num[index].value
        var url = `/api/cart/updateCart?uid=${localStorage.uid}&pid=${pid}&num=${num}`
        this.axios.get(url).then(result => {
          this.inquire()
        })
      }
    },
    plus (pid, index, stock) {
      if (this.$refs.num[index].value < stock) {
        let num = ++this.$refs.num[index].value
        var url = `/api/cart/updateCart?uid=${localStorage.uid}&pid=${pid}&num=${num}`
        this.axios.get(url).then(result => {
          this.inquire()
        })
      }
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
        this.cart(this.cartInfo)
        this.cartList = this.cartInfo[0]
        this.number = this.cartInfo[1]
        this.allPrice = this.cartInfo[2]
      })
    },
    delList (pid) {
      var url = `/api/cart/delProduct?uid=${localStorage.uid}&pid=${pid}`
      this.axios.get(url).then(result => {
        this.reload()
        // if (result.data.code === 1) {
        //   this.inquire()
        // }
      })
    },
    list_null () {
      if (this.cartList) {
        this.bool = true
      } else {
        this.bool = false
      }
    },
    ...mapMutations(['cart'])
  },
  mounted () {
    this.inquire()
  },
  updated () {
    this.list_null()
  }
}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
  .cart
    .wrap
      width 1190px
      margin 0 auto
      .nav_bar
        height 44px
        line-height 44px
        background-color #f5f5f5
        color #666
        a
          padding-right 3px
      .cart_null
        height 300px
        line-height 300px
        margin-bottom 40px
        font-size 18px
        background-color #fff
        color #666
        text-align center
        span
          display inline-block
          width 80px
          height 60px
          margin-right 14px
          background url(/staticimg/base.png) no-repeat -78px -132px
          vertical-align -12px
        a
          padding 0 5px
          color #e90404
      .cart_list
        margin-bottom 43px
        table
          width 100%
          border-spacing 0px
          thead
            td
              height 54px
              font-size 14px
              color #666
              background-color #fff
              border-bottom 1px solid #ededed
              text-align center
            .state
              width 111px
              .all_checkbox
                margin-right 10px
                .checkbox
                  margin-right 10px
                  position relative
                  display inline-block
                  width 18px
                  height 18px
                  vertical-align middle
                  label
                    background #e32332 url(/staticimg/base.png) no-repeat -78px -100px
                    border-color #e32332
                    cursor pointer
                    position absolute
                    top 0
                    left 0
                    width 16px
                    height 16px
                    border 1px solid #d4d4d4
                    vertical-align middle
                  span
                    vertical-align middle
            .num
              width 200px
            .price
              width 150px
            .operation
              width 150px
          tbody
            tr
              height 136px
              td
                background-color #fff
                border-bottom 1px solid #ededed
                text-align center
              .state
                .checkbox
                  position relative
                  display inline-block
                  width 18px
                  height 18px
                  vertical-align middle
                  // input
                    // display none
                  // label
                    // background #e32332 url(/staticimg/base.png) no-repeat -78px -100px
                    // border-color #e32332
                    // background-color #fff
                    // position absolute
                    // top 0
                    // left 0
                    // width 16px
                    // height 16px
                    // border 1px solid #d4d4d4
                    // cursor pointer
                    // vertical-align middle
                  .label_red
                    background #e32332 url(/staticimg/base.png) no-repeat -78px -100px
                    border-color #e32332
              td
                .cf
                  margin 29px 0
                  &:after
                    clear()
                  .cf_img
                    float left
                    a
                      img
                        width 72px
                        height 72px
                        border 1px solid #ddd
                  .cf_name
                    float left
                    margin-left 18px
                    text-align left
                    .title
                      width 486px
                      display block
                      font-size 14px
                      color #424242
                      font-weight normal
                      height 20px
                      a
                        max-width 400px
                        height 20px
                        overflow hidden
                        float left
                        margin-right 5px
                        color #424242
                        display inline-block
                    p
                      color #999
                      height 18px
                      display inline-block
                      overflow hidden
                      max-width 400px
              td
                .number_input
                  margin-right 0
                  display inline-block
                  width 78px
                  height 22px
                  border 1px solid #e0e0e0
                  vertical-align middle
                  .reduce
                    background url(/staticimg/base.png) no-repeat -234px -97px
                    display inline-block
                    width 18px
                    height 22px
                    vertical-align middle
                    cursor pointer
                    padding-left 4px
                    &:hover
                      background-color #f0f0f0
                  input
                    width 28px
                    height 20px
                    line-height 20px
                    text-align center
                    border 0
                    vertical-align middle
                    font-size 12px
                  .plus
                    background url(/staticimg/base.png) no-repeat -233px -132px
                    display inline-block
                    width 20px
                    height 22px
                    vertical-align middle
                    cursor pointer
                    &:hover
                      background-color #f0f0f0
                .stock
                  padding-top 8px
                  color #999
                  font
                    font-style normal
              .price
                font-size 20px
                color #e90404
                background-color #fff
                border-bottom 1px solid #ededed
                text-align center
                width 150px
                font
                  font-style normal
              td
                .del
                  display inline-block
                  width 22px
                  height 20px
                  padding-top 2px
                  border-radius 11px
                  &:hover
                    background-color #e32332
                  &:hover span
                    background-position -292px -20px
                  span
                    display inline-block
                    width 8px
                    height 8px
                    overflow hidden
                    background url(/staticimg/base.png) no-repeat -292px 0
        .total_bar
          margin-top 5px
          height 90px
          line-height 90px
          padding 0 32px 0 28px
          background-color #fff
          font-size 14px
          color #666
          .f_left
            float left
            .all_checkbox
              margin-right 10px
              .checkbox
                margin-right 10px
                position relative
                display inline-block
                width 18px
                height 18px
                vertical-align middle
                label
                  background #e32332 url(/staticimg/base.png) no-repeat -78px -100px
                  border-color #e32332
                  cursor pointer
                  position absolute
                  top 0
                  left 0
                  width 16px
                  height 16px
                  border 1px solid #d4d4d4
                  vertical-align middle
                span
                  vertical-align middle
            a
              margin-left 22px
            .batch_delete
              &:hover
                color #e90404
          .f_right
            float right
            position relative
            .f_right
              float right
              position relative
              .btn_checkout
                width 188px
                height 50px
                margin-left 20px
                font-size 18px
                border 0
                cursor pointer
                color #fff
                background-color #e32332
              .tip_checkout
                position absolute
                bottom 79px
                right 0
                height 43px
                line-height 43px
                padding 0 23px
                background-color #fff
                border 1px solid #e32332
                color #e90404
                span
                  position absolute
                  bottom -8px
                  left 50%
                  margin-left -7px
                  width 15px
                  height 8px
                  overflow hidden
                  background url(/staticimg/base.png) no-repeat -54px -12px
            .f_right
              float right
              position relative
              height 90px
              .num
                font-size 24px
                margin 0 7px
                color #e90404
                font
                  font-style normal
              span
                margin 0 7px
                color #e90404
                .checkoutPrice
                  font-size 20px
</style>
