// django-vue/src/router/router.js
import { createRouter,createWebHistory } from 'vue-router' //引入路由插件函数
 
import IndexView from '@/views/index.vue'   //引入被路由到的页面相关文件
import PaasView from '@/views/paas.vue'
import vuesView from '@/views/vues.vue'
import LogView from "@/views/log.vue"
import PopulationView from '@/views/population.vue';
 
const routes = [
    {
        path: '/',
        name: 'IndexView',
        component: IndexView
    },
    // 新增路由
    {
        path: '/paas',
        name: 'PaasView',
        component: PaasView
    },
 
    {
        path: '/log',
        name: 'LogView',
        component: LogView
    },
    {
        path: '/vues',
        name: 'vuesView',
        component: vuesView
    },
    {
        path: '/population',
        name: 'PopulationView',
        component: PopulationView
    },
]
 
 
// 创建路由
const router = createRouter({
    history: createWebHistory(),
    routes
});
 
export default router