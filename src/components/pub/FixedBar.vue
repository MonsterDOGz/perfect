<template>
    <div class="fixedBar">
        <ul>
            <li class="center">
                <a href="javascript:;" class="needLogin">
                    <span></span>
                </a>
                <p class="tip" style="display:none;left:-128px;opacity:0;">
                    <a href="javascript:;" class="needLogin">个人中心</a>
                </p>
            </li>
            <li class="myLike">
                <a href="javascript:;" class="needLogin">
                    <span></span>
                </a>
                <p class="tip" style="display:none;left:-128px;opacity:0;">
                    <a href="javascript:;" class="needLogin">我的关注</a>
                </p>
            </li>
            <li class="fixed_cart">
                <a href="javascript:;">
                    <span>
                        <i></i>
                        购物车
                        <span class="cartNum">0</span>
                    </span>
                </a>
            </li>
            <li class="online">
                <a href="javascript:;" class="needLogin">
                    <span></span>
                </a>
                <p class="tip" style="display:none;left:-128px;opacity:0;">
                    <a href="javascript:;" class="needLogin">在线客服</a>
                </p>
            </li>
        </ul>
        <p class="go_top" title="回到顶部">
            <a href="javascript:;">
                <span></span>
            </a>
        </p>
    </div>
</template>

<script>
export default {

}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
    .fixedBar
        position fixed
        top 0
        right 0
        height 100%
        width 35px
        background-color #0a0a0a
        text-align center
        z-index 2
        ul
            position absolute
            top 50%
            left 0
            width 100%
            margin-top -140px
            li
                position relative
                padding-bottom 6px
                .needLogin
                    height 35px
                    display block
                    color #fff
                    span
                        display inline-block
                .tip
                    position absolute
                    top 0
                    width 71px
                    padding-left 15px
                    height 37px
                    line-height 37px
                    text-align left
                    background url(/staticimg/base.png) no-repeat -94px -90px
                    color #fff
                    .needLogin
                        height 35px
                        display block
                        color #fff
            .center
                .needLogin
                    span
                        background url(/staticimg/base.png) no-repeat -228px -74px
                        width 18px
                        height 18px
                        margin-top 8px
            .myLike
                .needLogin
                    span
                        background url(/staticimg/base.png) no-repeat -228px -42px
                        width 19px
                        height 15px
                        margin-top 11px
            .fixed_cart
                a
                    display block
                    color #fff
                    span
                        width 22px
                        margin 0 auto
                        padding 13px 2px
                        font-size 13px
                        border-top 1px solid #323232
                        border-bottom 1px solid #323232
                        display inline-block
                        i
                            display inline-block
                            width 22px
                            height 18px
                            margin-bottom 7px
                            background url(/staticimg/base.png) no-repeat -184px -56px
                            font-size 13px
                        .cartNum
                            display inline-block
                            width 21px
                            height 21px
                            margin-top 8px
                            line-height 21px
                            font-size 11px
                            text-align center
                            background-color #df2f3a
                            border-radius 11px
                            font-style normal
                            padding 0
            .online
                .needLogin
                    span
                        background url(/staticimg/base.png) no-repeat -228px -57px
                        width 18px
                        height 16px
                        margin-top 10px
        .go_top
            position absolute
            bottom 50px
            left 0
            width 35px
            height 35px
            a
                height 35px
                display block
                color #fff
                span
                    width 24px
                    height 22px
                    margin-top 6px
                    background url(/staticimg/base.png) no-repeat -228px -20px
                    display inline-block
</style>
