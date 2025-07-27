<!-- django-vue/src/views/IndexView.vue -->
<template>
    <div class="index-view">
      <h1>主页</h1>
      <p>欢迎来到主页！这里是项目的入口页面。</p>
    <!-- 功能导航按钮区块 -->
    <div class="home-actions">
      <router-link to="/index" class="home-button">可视化大屏界面</router-link>
      <router-link to="/population" class="home-button">查看人口数据</router-link>
      <router-link to="/about" class="home-button">关于我</router-link>
      </div>
    </div>
  </template>
  
<script>

</script>
  
<style>
  .index-view {
    text-align: center;
  padding: 40px 20px;
  }
  h1 {
    color: #333;
  margin-bottom: 20px;
  }
  p {
  font-size: 18px;
    color: #666;
  margin-bottom: 30px;
}
.home-actions {
  display: flex;
  justify-content: center;
  gap: 24px;
  margin-top: 30px;
  }
.home-button {
    display: inline-block;
  padding: 12px 28px;
  background: linear-gradient(135deg, #36d1c4 0%, #5b86e5 100%);
  color: #fff;
    text-decoration: none;
  border-radius: 25px;
  font-size: 16px;
  font-weight: 500;
  box-shadow: 0 2px 8px rgba(91,134,229,0.10);
  transition: background 0.3s, transform 0.2s;
  border: none;
}
.home-button:hover {
  background: linear-gradient(135deg, #5b86e5 0%, #36d1c4 100%);
  transform: translateY(-2px) scale(1.05);
  color: #fff;
  }
</style>