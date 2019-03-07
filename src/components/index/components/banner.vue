<template>
  <div class="banner">
    <div class="wrap">
      <el-carousel :interval="4000" type="card" height="439px" arrow="never" indicator-position="none">
        <el-carousel-item v-for="item in bannerInfo" :key="item.bid">
          <router-link :to="'/products/'+item.pid">
            <img :src="'/api'+item.bname" width="951px" height="439px">
          </router-link>
        </el-carousel-item>
      </el-carousel>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      bannerInfo: {}
    }
  },
  methods: {
    banner () {
      var url = `/api/product/banner`
      this.axios.get(url).then(result => {
        this.bannerInfo = result.data.data
      })
    }
  },
  created () {
    this.banner()
  }
}
</script>

<style lang="stylus" scoped>
  .banner
    position relative
    height 439px
    background-color #565656
    .wrap
      position relative
      width 100%
      margin 0 auto
      .el-carousel__item
        width 951px
        h3
          color #475669
          font-size 14px
          opacity 0.75
          line-height 439px
          margin 0
      .el-carousel__item:nth-child(2n)
        background-color #99a9bf
      .el-carousel__item:nth-child(2n+1)
        background-color #d3dce6
</style>
