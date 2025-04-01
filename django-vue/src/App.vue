<!-- django-vue/App.vue -->
<template>
    <div>
        <router-view></router-view>
        <!-- 添加html跳转路由 -->
        <router-link to="/">主页index</router-link>
        <router-link to="/paas">paas界面</router-link>
        <router-link to="/log">log界面</router-link>
        <router-link to="/vues">vues界面</router-link>
        <router-link to="/population">population界面</router-link>
    </div>
</template>
 
<script>
export default {
    name: "App",
}
</script>
 
<style>
/* 这里可以添加一些全局样式 */
</style>