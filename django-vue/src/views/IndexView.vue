<!-- django-vue/src/views/IndexView.vue -->
<template>
    <div class="index-view">
      <h1>主页</h1>
      <p>欢迎来到主页！这里是项目的入口页面。</p>
      
      <!-- 添加一些功能按钮或导航链接 -->
      <div class="actions">
        <router-link to="/index" class="button">可视化大屏界面</router-link>
        <router-link to="/population" class="button">查看人口数据</router-link>
      </div>
    </div>
  </template>
  
<script>

</script>
  
<style scoped>
  .index-view {
    text-align: center;
    padding: 20px;
  }
  
  h1 {
    color: #333;
  }
  
  p {
    font-size: 16px;
    color: #666;
  }
  
  .actions {
    margin-top: 20px;
  }
  
  .button {
    display: inline-block;
    margin: 10px;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
  }
  
  .button:hover {
    background-color: #0056b3;
  }
</style>