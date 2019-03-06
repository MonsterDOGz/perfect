<template>
  <div class="buying">
    <div class="wrap">
      <div class="ad_list">
        <a href="javascript:;" class="ad_link"><img src="/staticimg/ad1.jpg"></a>
        <a href="javascript:;" class="ad_link"><img src="/staticimg/ad2.jpg"></a>
        <a href="javascript:;" class="ad_link"><img src="/staticimg/ad3.jpg"></a>
      </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="stylus" scoped>
  .buying
    padding-bottom 40px
    background-color #fff
    .wrap
      position relative
      padding-top 146px
      width 1190px
      margin 0 auto
      z-index 2
      .ad_list
        position absolute
        top -14px
        left 0
        a:nth-child(1)
          margin-left 0px
        .ad_link
          float left
          width 386px
          height 160px
          margin-left 16px
          transition 0.2s
          &:hover
            transform translate(0,-2px)
            box-shadow 0 3px 3px #ccc
          img
            width 386px
            height 160px
</style>
