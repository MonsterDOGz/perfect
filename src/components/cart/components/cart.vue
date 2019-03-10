<template>
  <div class="cart">
    <div class="wrap">
      <div class="nav_bar">
        <a href="javascript:;">首页</a>
        >
        <a href="javascript:;">我的购物车</a>
      </div>
      <div class="cart_null" style="display:none;">
        <span></span>
        购物车空空的哦~，赶紧
        <a href="javascript:;">去选购</a>
        吧！
      </div>
      <div class="cart_list">
        <form>
          <table>
            <thead>
              <tr>
                <td class="state">
                  <span class="all_checkbox">
                    <span class="checkbox">
                      <label></label>
                    </span>
                    <span>全选</span>
                  </span>
                </td>
                <td class="name">商品名称</td>
                <td class="num">数量</td>
                <td class="prices">价格</td>
                <td class="operation">操作</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="state">
                  <span class="checkbox">
                    <input type="checkbox">
                    <label></label>
                  </span>
                </td>
                <td>
                  <div class="cf">
                    <div class="cf_img">
                      <a href="javascript:;">
                        <img src="/staticimg/dota1.jpg" title="姜小虎-表情口罩">
                      </a>
                    </div>
                    <div class="cf_name">
                      <h1 class="title">
                        <a href="javascript:;" title="姜小虎-表情口罩">姜小虎-表情口罩</a>
                      </h1>
                      <p>款式：口罩：发呆</p>
                    </div>
                  </div>
                </td>
                <td></td>
                <td class="price"></td>
                <td></td>
              </tr>
            </tbody>
          </table>
          <div class="total_bar">
            <div class="f_left">
              <span class="all_checkbox">
                <span class="checkbox">
                  <label></label>
                </span>
                <span>全选</span>
              </span>
              <a href="javascript:;" class="batch_delete">删除选中的商品</a>
              <a href="javascript:;">继续购物</a>
            </div>
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
                  <font>1</font>
                </span>
                件商品，合计：
                <span>￥
                  <font class="checkoutPrice">12.00</font>
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
export default {

}
</script>

<style lang="stylus" scoped>
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
            td
              background-color #fff
              border-bottom 1px solid #ededed
              text-align center
              .checkbox
                position relative
                display inline-block
                width 18px
                height 18px
                vertical-align middle
                label
                  background url(/staticimg/base.png) no-repeat -78px -100px
                  border-color #e32332
                  position absolute
                  top 0
                  left 0
                  width 16px
                  height 16px
                  border 1px solid #d4d4d4
                  cursor pointer
                  vertical-align middle
              .cf
                margin 29px 0
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
                    a
                      max-width 400px
                      height 20px
                      overflow hidden
                      float left
                      margin-left 5px
                      color #424242
                      display inline-block
                  p
                    color #999
                    height 18px
                    display inline-block
                    overflow hidden
                    max-width 400px
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
</style>
