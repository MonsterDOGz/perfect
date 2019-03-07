<template>
  <div class="details">
    <div class="nav_bar">
      <div class="wrap">
        <a href="javascript:;">首页</a>>
        <a href="javascript:;">完美世界游戏周边</a>>
        <a href="javascript:;">完美世界周边</a>>
        <a href="javascript:;">诛仙手游-loz灵猴模型玩具</a>
      </div>
    </div>
    <div class="detail">
      <div class="wrap">
        <div class="gallery">
          <div class="bd">
            <div class="tempWrap">
              <ul style="width:1290px;">
                <li v-for="item in getInfo.pic" :key="item">
                  <img :src="'/api/'+item">
                  </li>
              </ul>
            </div>
          </div>
          <div class="hd">
            <ul>
              <li v-for="item in 3" :key="item">
                <img src="/staticimg/729f65ee-1aa9-4d32-a56c-fa387b21dfeb_100.jpg">
              </li>
            </ul>
          </div>
        </div>
        <div class="property">
          <div class="title">
            <h1>{{getInfo.pname}}</h1>
            <p>{{getInfo.label}}</p>
          </div>
          <p class="price">{{getInfo.price}}</p>
          <table>
            <tbody>
              <tr>
                <th>运费：</th>
                <td>
                  <div class="meta">
                    <span class="from">北京</span>至
                    <span class="shoppingTo">北京<i></i></span>
                    <font>快递：<span class="shoppingFee">￥15.00</span></font>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <table style="margin-left: -2px;">
                    <tbody>
                      <tr>
                        <th>颜色：</th>
                        <td>
                          <a href="javascript:;" class="option" v-for="item in 2" :key="item">
                            普通灵猴款（灰色）
                            <em></em>
                          </a>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
              <tr>
                <th>数量：</th>
                <td>
                  <span class="number">
                    <span class="reduce"></span>
                    <input type="text" value="1" min="1" stock="498" maxlength="3">
                    <span class="add"></span>
                  </span>
                  <span class="stock">
                    （库存<font>498</font>件）
                  </span>
                  <span class="sold">
                    已售出<font>2</font>件
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
          <div class="btns">
            <a href="javascript:;" class="btn_buy">立即购买</a>
            <a href="javascript:;" class="btn_addCart">
              <span></span>
              加入购物车
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['getInfo'],
  methods: {
    a () {
      console.log(this.getInfo)
    }
  },
  mounted () {
    this.a()
  }
}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
.details
  .nav_bar
    height 44px
    line-height 44px
    background-color #f5f5f5
    color #666
    .wrap
      width 1190px
      margin 0 auto
      a
        display inline-block
        padding-right 8px
        &:hover
          color #e90404
  .detail
    padding 30px 0 40px 0
    background-color #fff
    .wrap
      width 1190px
      margin 0 auto
      &:after
        clear()
      .gallery
        float left
        width 430px
        position relative
        overflow hidden
        margin-right 59px
        .bd
          .tempWrap
            overflow hidden
            position relative
            width 430px
            ul
              position relative
              overflow hidden
              li
                float left
                width 430px
                img
                  width 430px
                  height 430px
                  display block
        .hd
          width 100%
          padding-top 10px
          overflow hidden
          left 0
          bottom 30px
          z-index 1
          text-align center
          ul
            margin-right -10px
            overflow hidden
            li
              opacity 0.4
              float left
              text-align center
              img
                cursor pointer
                margin-right 10px
      .property
        width 684px
        font-size 14px
        float left
        .title
          h1
            padding-bottom 20px
            font-size 30px
            color #474747
            font-weight normal
          p
            font-size 16px
            color #666
        .price
          padding 20px 0
          margin 34px 0 25px 0
          font-size 26px
          color #e90404
          border-top 1px solid #efefef
          border-bottom 1px solid #efefef
        table
          font-size 14px
          th
            height 48px
            text-align left
            font-weight normal
            color #9a9a9a
            width 72px
          td
            .meta
              .from
                padding-right 5px
              .shoppingTo
                padding 5px 10px
                margin-left 5px
                cursor pointer
                border 1px solid #fff
                i
                  display inline-block
                  width 12px
                  height 6px
                  margin-left 5px
                  overflow hidden
                  background url(/staticimg/base.png) no-repeat 0 0
                  vertical-align middle
              font
                margin-left 29px
                font-style normal
          table
            th
              height 48px
              text-align left
              font-weight normal
              color #9a9a9a
              width 72px
            td
              .option
                padding 4px 13px
                border 1px solid #e0e0e0
                position relative
                margin-bottom 5px
                margin-right 4px
                color #333
                display inline-block
                em
                  display none
                  position absolute
                  bottom 0
                  right 0
                  width 13px
                  height 13px
                  background url(/staticimg/base.png) no-repeat -125px -204px
                  font-style normal
          td
            .number
              display inline-block
              width 78px
              height 22px
              margin-right 11px
              border 1px solid #e0e0e0
              vertical-align middle
              position relative
              .reduce
                background url(/staticimg/base.png) no-repeat -234px -97px
                display inline-block
                width 23px
                height 22px
                vertical-align middle
                cursor pointer
              input
                width 32px
                height 20px
                line-height 20px
                text-align center
                border 0
                vertical-align middle
                font-size 12px
                resize none
                outline 0
                position absolute
                left 23px
                top 1px
              .add
                background url(/staticimg/base.png) no-repeat -233px -132px
                display inline-block
                width 23px
                height 22px
                vertical-align middle
                cursor pointer
                position absolute
                right 0
            .stock
              color #999
              font
                font-style normal
            .sold
              padding-left 15px
              color #999
              font
                padding 0 5px
                color #c00
        .btns
          padding 20px 0 53px
          .btn_buy
            background-color #e32332
            color #fff
            display inline-block
            width 260px
            height 66px
            line-height 66px
            margin-right 16px
            text-align center
            font-size 24px
            &:hover
              background-color #c00
          .btn_addCart
            width 258px
            height 64px
            line-height 64px
            border 1px solid #e32330
            color #ea0406
            display inline-block
            margin-right 16px
            text-align center
            font-size 24px
            &:hover
              background-color #c00
              color #fff
            &:hover span
              background-position -184px -99px
            span
              width 32px
              height 24px
              display inline-block
              background url(/staticimg/base.png) no-repeat
              background-position -184px -74px
              margin-right 10px
              vertical-align -3px
</style>
