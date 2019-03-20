import Vue from 'vue'
import Router from 'vue-router'
// import IndexHome from '@/components/index/Home'
// import ProductsHome from '@/components/products/Home'
// import userRegister from '@/components/user/register'
// import CartHome from '@/components/cart/Home'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'IndexHome',
      component: () => import('@/components/index/Home')
    },
    {
      path: '/products/:pid',
      name: 'ProductsHome',
      component: () => import('@/components/products/Home')
    },
    {
      path: '/reg',
      name: 'userRegister',
      component: () => import('@/components/user/register')
    },
    {
      path: '/cart',
      name: 'CartHome',
      component: () => import('@/components/cart/Home')
    }
  ]
})
