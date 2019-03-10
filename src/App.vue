<template>
  <div id="app" v-if="isRouterAlive">
    <index-header></index-header>
    <router-view/>
    <index-footer></index-footer>
    <index-fixedbar></index-fixedbar>
  </div>
</template>

<script>
import IndexHeader from './components/pub/Header'
import IndexFooter from './components/pub/Footer'
import IndexFixedbar from './components/pub/FixedBar'

export default {
  name: 'App',
  provide () {
    return {
      reload: this.reload
    }
  },
  data () {
    return {
      isRouterAlive: true
    }
  },
  components: {
    IndexHeader,
    IndexFooter,
    IndexFixedbar
  },
  methods: {
    reload () {
      this.isRouterAlive = false
      this.$nextTick(function () {
        this.isRouterAlive = true
      })
    }
  }
}
</script>

<style>
body{
  font-size: 12px;
  color: #474747;
  font-family: "Microsoft YaHei", Arial, Helvetica, sans-serif;
  background-color: #f5f5f5;
}
body,ul,li,a,h1,h2,h3,h4,h5,h6,p,input,
textarea,table,tr,td,th{
  margin:0;
  padding:0;
}
a {
  text-decoration: none;
  color: #666;
}
ul {
  list-style: none;
}
</style>
