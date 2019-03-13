<template>
  <div class="allFloor">
    <div class="floor" v-for="item in floor" :key="item.fid">
      <div class="wrap">
        <div class="title">
          <p class="title_left">
            <span class="icon">
              <img :src="/api/+item.icon">
            </span>
            {{item.fname}}
          </p>
          <a href="javasctipt:;" class="title_right">
            更多
            <span></span>
          </a>
        </div>
        <div class="body">
          <a href="javascript:;" class="body_left">
            <img :src="/api/+item.fpic">
          </a>
          <div class="body_right">
            <div class="content">
              <div class="product_slideshow">
                <!-- 楼层轮播图 -->
                <el-carousel :interval="5000" arrow="always">
                  <el-carousel-item v-for="ite in item.fBanner" :key="ite.fbid">
                    <router-link :to="'/products/'+ite.pid">
                      <img :src="'/api'+ite.fbname" width="467px" height="300px">
                    </router-link>
                  </el-carousel-item>
                </el-carousel>
              </div>
              <div class="product_item" v-for="it in item.fProduct" :key="it.pid">
                <router-link :to="'/products/'+it.pid">
                  <img :src="'/api/'+it.pic[0]" :title="it.pname">
                </router-link>
                <p class="product_name" :title="it.pname">{{it.pname}}</p>
                <p class="price">￥ {{it.price}}</p>
                <div class="add">
                  <router-link :to="'/products/'+it.pid" class="btn" title="加入购物车">
                    <span></span>
                  </router-link>
                </div>
                <span class="comment">
                  <a href="javascript:;" class="review">
                    东西很好哦，计划买两个。
                  </a>
                  <a href="javascript:;" class="author">
                    来自 七月是季末 的评价
                  </a>
                </span>
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
  data () {
    return {
      floor: ''
    }
  },
  methods: {
    getFloor () {
      var url = `/api/product/indexFloor`
      this.axios.get(url).then(result => {
        this.floor = result.data.data
        for (let i = 0; i < this.floor.length; i++) {
          for (let n = 0; n < this.floor[i].fProduct.length; n++) {
            this.floor[i].fProduct[n].pic = this.floor[i].fProduct[n].pic.split(',')
          }
        }
      })
    }
  },
  created () {
    this.getFloor()
  }
}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
.allFloor
  .floor
    .wrap
      width 1205px
      margin 0 auto
      &:after
        clear()
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
        .title_right
          float right
          margin-top 10px
          font-size 16px
          color #666
          &:hover
            color #e90404
          &:hover span
            background-position -111px 0
          span
            display inline-block
            width 20px
            height 20px
            margin-left 5px
            background url(/staticimg/base.png) no-repeat -90px 0
            vertical-align -5px
      .body
        .body_left
          width 226px
          height 614px
          margin 0 15px 15px 0
          float left
          transition 0.3s
          &:hover
            rise()
          img
            width 226px
            height 614px
        .body_right
          overflow hidden
          position relative
          width 964px
          .content
            width 964px
            left 0px
            position relative
            overflow hidden
            padding 0
            margin 0
            float left
            .product_slideshow
              position relative
              width 467px
              height 300px
              margin-right 15px
              overflow hidden
              float left
              background red
              .el-carousel__item h3
                color #475669
                font-size 18px
                opacity 0.75
                line-height 300px
                margin 0
              .el-carousel__item:nth-child(2n)
                background-color #99a9bf
              .el-carousel__item:nth-child(2n+1)
                background-color #d3dce6
            .product_item
              position relative
              float left
              background #fff
              width 226px
              height 253px
              padding-top 47px
              margin 0 15px 15px 0
              text-align center
              transition 0.3s
              &:hover
                rise()
              &:hover .comment
                opacity 1
              a
                img
                  width 160px
                  height 160px
              .product_name
                font-size 14px
                margin 15px 15px 5px 15px
                max-height 38px
                overflow hidden
              .price
                  font-size 18px
                  color #eb0303
              .add
                position absolute
                top 10px
                right 10px
                .btn
                  display block
                  width 40px
                  height 40px
                  border-radius 50%
                  background-color #eee
                  &:hover
                    background-color #e32332
                  &:hover span
                    background-position -184px -38px
                  span
                    position absolute
                    top 50%
                    left 50%
                    transform translate(-50%,-50%)
                    display inline-block
                    width 22px
                    height 18px
                    background url(/staticimg/base.png) no-repeat -184px -56px
              .comment
                display block
                position absolute
                bottom 0
                padding 8px 30px
                background #ff6700
                width 166px
                height 56px
                opacity 0
                text-align left
                transition 0.3s
                .review
                  margin-tottom 5px
                  color #fff
                  display block
                  width 100%
                  height 36px
                .author
                  color rgba(255,255,255,0.6)
                  overflow hidden
                  width 100%
                  height 20px
</style>
