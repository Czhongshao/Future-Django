// django-vue/src/router/router.js
import { createRouter, createWebHistory } from 'vue-router';

const routes = [
  {
    path: '/',
    name: 'Home', // 首页，入口页面
    component: () => import('@/views/IndexView.vue')
  },
  {
    path: '/population',
    name: 'Population', // 人口数据可视化页面
    component: () => import('@/views/PopulationView.vue')
  },
  {
    path: '/index',
    name: 'IndexPage', // 可视化大屏主页面
    component: () => import('@/views/IndexPage.vue')
  },
  {
    path: '/about',
    name: 'About', // 关于页面
    component: () => import('@/views/AboutView.vue')
  },
];

// 创建并导出路由实例
const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;