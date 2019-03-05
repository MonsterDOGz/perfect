<template>
    <div class="footer">
        <div class="about">
            <div class="wrap">
                <ul class="cf">
                    <li class="goods">
                        <span></span>正品保证
                    </li>
                    <li class="shopping">
                        <span></span>轻松购物
                    </li>
                    <li class="logistics">
                        <span></span>快速配送
                    </li>
                    <li class="return">
                        <span></span>无忧退换
                    </li>
                </ul>
                <div class="cf_link">
                    <ul>
                        <li class="first_li">购物指南</li>
                        <li><a href="javascript:;">常见问题</a></li>
                        <li><a href="javascript:;">订单状态</a></li>
                        <li><a href="javascript:;">购物流程</a></li>
                        <li><a href="javascript:;">支付方式</a></li>
                    </ul>
                    <ul>
                        <li class="first_li">售后服务</li>
                        <li><a href="javascript:;">退换货政策</a></li>
                        <li><a href="javascript:;">发票政策</a></li>
                    </ul>
                    <ul>
                        <li class="first_li">关注我们</li>
                        <li><a href="javascript:;">公司官网</a></li>
                        <li><a href="javascript:;">商务合作</a></li>
                    </ul>
                    <div class="contact">
                        <p class="tel">028-68723699</p>
                        <p class="time">周一至周日 9:00-22:00</p>
                        <a href="javascript:;" class="kf">
                            <span></span>在线客服
                        </a>
                        <a href="javascript:;" class="tsjb">投诉举报</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="wrap">
                <ul class="cf">
                    <li><a href="javascript:;">公司介绍</a></li>
                    <li><a href="javascript:;">开发团队</a></li>
                    <li><a href="javascript:;">招聘信息</a></li>
                    <li><a href="javascript:;">联系我们</a></li>
                    <li><a href="javascript:;">完美世界隐私政策</a></li>
                    <li><a href="javascript:;">完美世界用户协议</a></li>
                    <li><a href="javascript:;">完美商城服务协议</a></li>
                    <li><a href="javascript:;">Cookie政策</a></li>
                    <li class="last_li"><a href="javascript:;">网站地图</a></li>
                </ul>
                <p class="text">京ICP证：050016号营业执照《网络文化经营许可证》编号：文网文【2017】8929-1007号《网络视听许可证》编号：0110587京公网安备11010502033859号<br>©完美世界 版权所有 Perfect World.All Right Reserved.</p>
                <div class="link">
                    <a href="javascript:;"><img src="/staticimg/copyright01.jpg" alt="经营性网站备案信息" title="经营性网站备案信息"></a>
                    <a href="javascript:;"><img src="/staticimg/copyright02.jpg" alt="可信网站示范单位" title="可信网站示范单位"></a>
                    <a href="javascript:;"><img src="/staticimg/copyright03.jpg" alt="举报热线" title="举报热线"></a>
                    <a href="javascript:;"><img src="/staticimg/copyright04.jpg" alt="中国网络游戏版权保护联盟" title="中国网络游戏版权保护联盟"></a>
                    <a href="javascript:;"><img src="/staticimg/copyright05.jpg" alt="绿色通道" title="绿色通道"></a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style lang="stylus" scoped>
@import '~styles/index.styl'
.footer
    .about
        padding 23px 0 40px
        background-color #fff
        margin-top 40px
        .wrap
            margin 0 auto
            width 1190px
            .cf
                margin-bottom 20px
                &:after
                    clear()
                li
                    float left
                    width 297px
                    height 45px
                    line-height 45px
                    text-align center
                    font-size 18px
                    border-right 1px solid #e9e9e9
                    color #999
                    span
                        display inline-block
                        width 45px
                        height 45px
                        margin-right 15px
                        background url(/staticimg/about.png) no-repeat
                        vertical-align middle
                .goods
                    span
                        background-position 0 0
                .shopping
                    span
                        background-position -45px 0
                .logistics
                    span
                        background-position -90px 0
                .return
                    width 296px
                    border-right none
                    span
                        background-position -135px 0
            .cf_link
                padding-top 40px
                border-top 1px solid #e9e9e9
                &:after
                    clear()
                ul
                    float left
                    width 298px
                    text-indent 110px
                    li
                        position relative
                        height 24px
                        a
                            color #999
                            &:hover
                                color #e90404
                    .first_li
                        height 35px
                        font-size 14px
                .contact
                    min-height 115px
                    width 227px
                    padding-left 67px
                    border-left 1px solid #e9e9e9
                    float right
                    .tel
                        font-size 24px
                    .time
                        padding 16px 0 24px 0
                        font-size 14px
                        color #999
                    .kf
                        display block
                        width 154px
                        height 35px
                        line-height 35px
                        text-align center
                        color #ea0f1f
                        font-size 16px
                        border 1px solid #ff5353
                        border-radius 3px
                        &:hover
                            background-color #e32331
                            border-color #e32331
                            color #fff
                        &:hover span
                            background-position -240px 0
                        span
                            display inline-block
                            width 18px
                            height 15px
                            margin-right 6px
                            background url(/staticimg/base.png) no-repeat -188px 0
                            vertical-align middle
                    .tsjb
                        color #474747
                        text-indent 50px
                        font-size 14px
                        padding 16px 0 0
                        display block
    .copyright
        padding 25px 0 30px 0
        text-align center
        .wrap
            width 1190px
            margin 0 auto
            .cf
                width 755px
                margin 0 auto
                overflow hidden
                li
                    float left
                    padding 0 8px 0 8px
                    height 12px
                    line-height 12px
                    border-right 1px solid #ddd
                    text-align center
                    margin-right -1px
                    a
                        transition 0.1s
                        &:hover
                            color #e90404
                .last_li
                    border-right none
            .text
                padding 24px 0 15px 0
                color #999
            .link
                a
                    margin 0 3px
                    img
                        width 108px
                        height 40px
</style>
