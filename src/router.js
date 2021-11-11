import VueRouter from "vue-router";
import amp from './components/amp'

const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
} 

export default new VueRouter({
    mode: 'history',
    routes: [
        {path: '/', component: amp},
        {path: '/msg/:msg', name: 'amp', component: amp},
    ]
}) 