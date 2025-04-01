<!-- django-vue/src/App.vue -->
<template>
  <div class="app-container">
    <router-view></router-view>
    <div class="nav-links">
      <router-link to="/">主页</router-link>
      <router-link to="/population">人口数据</router-link>
      <router-link to="/about">关于我们</router-link>
      <router-link to="/index">初始界面效果</router-link>

    </div>
  </div>
</template>

<script>
export default {
  name: "App"
};
</script>

<style>
.app-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
}
.nav-links {
  margin-top: 20px;
}
.nav-links a {
  margin: 0 10px;
  text-decoration: none;
  color: #333;
  font-weight: bold;
}
.nav-links a:hover {
  text-decoration: underline;
}
</style>