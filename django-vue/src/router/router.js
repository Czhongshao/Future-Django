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
    path: '/index',
    name: 'Index',
    component: () => import('@/views/IndexPage.vue')
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;