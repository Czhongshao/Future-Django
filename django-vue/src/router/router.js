// django-vue/src/router/router.js
import { createRouter, createWebHistory } from 'vue-router';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('@/views/IndexView.vue')
  },
  {
    path: '/population',
    name: 'Population',
    component: () => import('@/views/PopulationView.vue')
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('@/views/AboutView.vue') // 添加 About 页面的路由
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;