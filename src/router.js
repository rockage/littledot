import VueRouter from "vue-router";
import index from './components/index'
import products from './components/products'
import product_view from './components/product_view'
import forums from './components/forums'
import contact from './components/contact'
import WX20211208 from './components/contact'


const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
} 

export default new VueRouter({
    mode: 'history',
    routes: [
        {path: '/', name: 'index', component: index},
        {path: '/products/:msg', name: 'products', component: products},
        {path: '/forums', name: 'forums', component: forums},
        {path: '/contact', name: 'contact', component: contact},
        {path: '/product_view/:msg', name: 'product_view', component: product_view},
    ]
}) 