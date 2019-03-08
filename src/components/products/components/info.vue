<template>
  <div class="info">
    <div class="wrap">
      <div class="left">
        <span>猜你喜欢</span>
        <ul>
          <li v-for="item in productList" :key="item.pid">
            <a href="javascript:;">
              <img :src="'/api/'+item.pic[0]">
            </a>
            <p class="name" title="梦间集-角色文件夹">{{item.pname}}</p>
            <p class="price">{{item.price}}</p>
          </li>
        </ul>
      </div>
      <div class="right">
        <ul class="info_nav">
          <li>
            <a href="javascript:;">商品介绍</a>
          </li>
          <li>
            <a href="javascript:;">
              产品评论
              <span>(0)</span>
              </a>
          </li>
        </ul>
        <div class="desc_pane">
          <div class="content" style="display:block;">
            <p v-for="item in getInfo.introduce" :key="item">
              <img :src="'/api/'+item" style="float:left;">
            </p>
          </div>
          <div class="content" style="display:none;">
            <div class="comment">
              <div class="rate_header">
                <div class="rate_score">
                  <p class="num">83%</p>
                  <p class="stars"></p>
                  <span>好评度</span>
                </div>
                <div class="rate_bar">
                  <div>
                    <font>好评(83%)</font>
                    <p>
                      <span style="width:83%"></span>
                    </p>
                  </div>
                  <div>
                    <font>中评(0%)</font>
                    <p>
                      <span style="width:0%"></span>
                    </p>
                  </div>
                  <div>
                    <font>差评(17%)</font>
                    <p>
                      <span style="width:17%"></span>
                    </p>
                  </div>
                </div>
                <div class="f_right">
                  <span>买家印象：</span>
                  <ul>
                    <li>
                      <a href="javascript:;">扭蛋(2)</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="rate_toolbar">
                <a href="javascript:;">
                  全部评价 (
                  <span>6</span>
                  )
                </a>
                <a href="javascript:;">
                  晒图 (
                  <span>0</span>
                  )
                </a>
                <a href="javascript:;">
                  好评 (
                  <span>5</span>
                  )
                </a>
                <a href="javascript:;">
                  中评 (
                  <span>0</span>
                  )
                </a>
                <a href="javascript:;">
                  差评 (
                  <span>1</span>
                  )
                </a>
              </div>
              <div class="comment_list">
                <ul>
                  <li v-for="item in 5" :key="item">
                    <div class="date">
                      <p class="stars"></p>
                      <p>2018年09月03日 10:06</p>
                    </div>
                    <div class="content">
                      <div class="text">
                        感觉很丑，不满意。
                      </div>
                      <p class="num">
                        <a href="jsvascript:;">
                          点赞（<span>0</span>）
                        </a>
                      </p>
                    </div>
                    <div class="from">
                      <p>
                        <span>
                          <img src="/staticimg/user.png">
                        </span>
                        <font>匿名用户</font>
                      </p>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['getInfo'],
  data () {
    return {
      productList: ''
    }
  },
  methods: {
    getAll () {
      var url = `/api/product/allProduct`
      this.axios.get(url).then(result => {
        this.productList = result.data.data
        for (let i = 0; i < this.productList.length; i++) {
          this.productList[i].pic = this.productList[i].pic.split(',')
        }
        let random = Math.floor(Math.random() * 25)
        this.productList = this.productList.slice(random, random + 6)
      })
    }
  },
  mounted () {
    this.getAll()
  }
}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
.info
  padding 42px 0 40px 0
  .wrap
    width 1190px
    margin 0 auto
    &:after
      clear()
    .left
      width 160px
      padding 0 15px 30px 15px
      margin-right 20px
      background-color #fff
      color #666
      float left
      span
        display inline-block
        width 100%
        height 37px
        padding-top 23px
        border-bottom 1px solid #e0e0e0
        font-size 16px
      ul
        li
          padding 15px 0 20px 0
          text-align center
          border 1px solid #fff
          &:hover
            border-color #e32332
          a
            img
              width 120px
              height 120px
          .name
            padding-top 10px
          .price
            color #e90404
    .right
      width 980px
      background-color #fff
      float left
      .info_nav
        overflow hidden
        padding 17px 0
        border-bottom 1px solid #e0e0e0
        li
          float left
          width 200px
          height 25px
          line-height 25px
          text-align center
          border-left 1px solid #e0e0e0
          margin-left -1px
          font-size 18px
          color #666
      .desc_pane
        .content
          .comment
            padding 0 40px 40px 40px
            color #666
            .rate_header
              padding 38px 0 48px 0
              &:after
                clear()
              .rate_score
                width 133px
                text-align center
                float left
                .num
                  color #e90404
                  font-size 24px
                .stars
                  background-position 0 -16px
                  width 99px
                  height 16px
                  margin 0 auto 3px auto
                  background url(/staticimg/stars2.png) no-repeat
              .rate_bar
                padding-left 50px
                float left
                div
                  padding 8px 0 3px 0
                  font
                    height 29px
                    width 57px
                    padding-right 10px
                    font-weight normal
                    text-align left
                  p
                    width 105px
                    height 9px
                    overflow hidden
                    background-color #eceeed
                    float right
                    margin-top 4px
                    span
                      display block
                      height 9px
                      background-color #e32332
              .f_right
                width 498px
                float right
                span
                  float left
                ul
                  li
                    float left
                    a
                      display inline-block
                      height 21px
                      line-height 21px
                      padding 0 6px
                      margin 0 0 8px 4px
                      background-color #fff6f7
                      border 1px solid #fcbfc4
                      color #676664
                      &:hover
                        border-color #e32332
                        color #e90506
            .rate_toolbar
              height 35px
              line-height 35px
              background-color #f5f5f5
              a
                // color #e90404
                margin 0 15px
                font-size 14px
                &:hover
                  color #e90404
            .comment_list
              ul
                li
                  &:after
                    clear()
                  .date
                    width 170px
                    color #999
                    padding 27.5px 0
                    border-bottom 1px solid #f5f5f5
                    float left
                    .stars
                      width 76px
                      height 14px
                      margin-bottom 24px
                      background url(/staticimg/stars3.png) no-repeat
                      background-position 0 -56px
                  .content
                    width 500px
                    padding-right 50px
                    font-size 14px
                    padding 25px 0
                    border-bottom 1px solid #f5f5f5
                    float left
                    .text
                      padding-bottom 15px
                      line-height 24px
                    .num
                      padding-top 5px
                      height 15px
                      line-height 15px
                      font-size 12px
                      a
                        position relative
                        padding-right 8px
                        &:hover
                          color #e90404
                  .from
                    width 150px
                    color #999
                    padding 39.5px 0
                    border-bottom 1px solid #f5f5f5
                    float left
                    p
                      span
                        display inline-block
                        width 30px
                        height 30px
                        margin-right 9px
                        border-radius 15px
                        overflow hidden
                        vertical-align middle
                        img
                          width 30px
                          height 30px
                      font
                        vertical-align middle
                        font-style normal
</style>
