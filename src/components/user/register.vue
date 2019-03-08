<template>
  <div class="register">
    <div class="circle_box">
      <div class="circle_1"></div>
      <div class="circle_2"></div>
      <div class="circle_3"></div>
      <div class="circle_4"></div>
      <div class="circle_5"></div>
    </div>
    <div class="register"></div>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="stylus" scoped>
  .register
    position fixed
    z-index 10
    top 0
    left 0
    background url(/staticimg/animate-bg.jpg) #fff center top no-repeat
    height 100%
    width 100%
    .circle_box
      position absolute
      left 0
      top 0
      width 100%
      height 100%
      overflow hidden
      .circle_1
        position absolute
        left 50%
        margin 0 0 0 -716px
        top 258px
        width 630px
        height 630px
        background url(/staticimg/circle-1.png) left center no-repeat
        animation clockwise 40s linear infinite
      @keyframes clockwise
        0%
          transform rotate(0deg)
        100%
          transform rotate(360deg)
      .circle_2
        position absolute
        right -308px
        top 202px
        width 616px
        height 616px
        background url(/staticimg/circle-2.png) left center no-repeat
        animation antiClockwise 40s linear infinite
      .circle_3
        position absolute
        left 50%
        top -590px
        margin 0 0 0 -590px
        width 1181px
        height 1181px
        background url(/staticimg/circle-3.png) left center no-repeat
        animation antiClockwise 40s linear infinite
      @keyframes antiClockwise
        0%
          transform rotate(360deg)
        100%
          transform rotate(0deg)
      .circle_4
        position absolute
        left 50%
        top 160px
        margin 0 0 0 450px
        width 269px
        height 417px
        background url(/staticimg/circle-4.png) left center no-repeat
        animation down_float 10s linear infinite
      @keyframes down_float
        0%
          transform translate(0px,0px)
          opacity 1
        50%
          transform translate(0px,25px)
          opacity 0.5
        100%
          transform translate(0px,0px)
          opacity 1
      .circle_5
        position absolute
        left 50%
        top 350px
        margin 0 0 0 -590px
        width 1446px
        height 207px
        background url(/staticimg/circle-5.png) left center no-repeat
        animation up_float 10s linear infinite
      @keyframes up_float
        0%
          transform translate(0px,0px)
          opacity 0.3
        50%
          transform translate(0px,-25px)
          opacity 1
        100%
          transform translate(0px,0px)
          opacity 0.3
</style>
