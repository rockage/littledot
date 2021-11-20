import VueRouter from "vue-router";
import index from './components/index'
import products from './components/products'
import products_view from './components/product_view'
import forums from './components/forums'
import contact from './components/contact'


const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
} 

export default new VueRouter({
    mode: 'history',
    routes: [
        {path: '/', component: index},
        {path: '/msg/:msg', name: 'products', component: products},
        {path: '/forums', name: 'forums', component: forums},
        {path: '/contact', name: 'contact', component: contact},
        {path: '/products_view/:msg', name: 'products_view', component: products_view},
    ]
}) 