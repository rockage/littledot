import VueRouter from "vue-router";
import products from './components/products'

const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
} 

export default new VueRouter({
    mode: 'history',
    routes: [
        {path: '/', component: products},
        {path: '/msg/:msg', name: 'products', component: products},
    ]
}) 