<template>
  <div class="hot_comment">
    <div class="wrap">
      <div class="title">
        <p class="title_left">
          <span class="icon">
            <img src="/staticimg/hot_review.png">
          </span>
          玩家热评
        </p>
      </div>
      <ul class="body">
        <li class="in" v-for="item in 6" :key="item">
          <a href="javascript:;">
            <img src="/staticimg/hotComment1.jpg">
            <div class="info">
              <div class="ellipsis">东西十分给力，快递也十分给力，带出去很多人羡慕不已！</div>
              <p class="from">
                <span></span>
                来自于
                <font>139****1197</font>
              </p>
              <p class="product_name">
                粘土人 痛苦女王
                <span class="suffix">￥298.00</span>
              </p>
            </div>
          </a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
  .hot_comment
    padding-bottom 25px
    .wrap
      width 1205px
      margin 0 auto
      .title
        padding 37px 0 20px 0
        font-size 28px
        overflow hidden
        width 1190px
        .title_left
          float left
          .icon
            display inline-block
            width 35px
            height 35px
            margin-right 12px
            vertical-align middle
            img
              width 35px
              height 35px
      .body
        overflow hidden
        .in
          float left
          overflow hidden
          width 330px
          height 120px
          padding 28px
          margin 0 15px 15px 0
          background-color #fff
          transition 0.3s
          &:hover
            rise()
          a
            img
              width 130px
              height 130px
              float left
            .info
              width 184px
              margin-left 15px
              line-height 20px
              color #666
              float left
              .ellipsis
                height 81px
                overflow hidden
              .from
                color #999
                span
                  display inline-block
                  width 14px
                  height 12px
                  margin-right 5px
                  background url(/staticimg/base.png) no-repeat -174px 0
                  vertical-align -1px
                font
                  padding-left 5px
                  font-style normal
              .product_name
                font-size 14px
                height 20px
                overflow hidden
                .suffix
                  color #ea0406
                  padding-left 6px
                  margin-left 6px
                  border-left 1px solid #ddd
</style>
