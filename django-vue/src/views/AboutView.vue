<template>
  <div class="about-view">
    <h1>关于我</h1>
    <div class="profile">
      <img src="https://github.com/Czhongshao.png" alt="GitHub头像" class="avatar">
      <h2>Czhongshao</h2>
      <p>Python爱好学习者，专注于数据可视化项目</p>
    </div>
    
    <div class="links">
      <a href="https://github.com/Czhongshao" target="_blank" class="github-link">
        <i class="github-icon">🐙</i>
        我的GitHub主页
      </a>
      <a href="https://github.com/Czhongshao/Future-Django" target="_blank" class="project-link">
        <i class="project-icon">📊</i>
        项目GitHub地址
      </a>
    </div>
    
    <div class="back-link">
      <router-link to="/" class="back-btn">返回首页</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AboutView'
};
</script>

<style scoped>
.about-view {
  text-align: center;
  padding: 40px 20px;
  max-width: 600px;
  margin: 0 auto;
}

.profile {
  margin-bottom: 30px;
}

.avatar {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  border: 4px solid #007bff;
  margin-bottom: 20px;
}

h1 {
  color: #333;
  margin-bottom: 30px;
}

h2 {
  color: #007bff;
  margin-bottom: 10px;
}

p {
  font-size: 16px;
  color: #666;
  margin-bottom: 30px;
}

.links {
  display: flex;
  flex-direction: column;
  gap: 15px;
  margin-bottom: 30px;
}

.github-link, .project-link {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  padding: 12px 24px;
  background-color: #007bff;
  color: white;
  text-decoration: none;
  border-radius: 8px;
  font-size: 16px;
  transition: background-color 0.3s;
}

.github-link:hover, .project-link:hover {
  background-color: #0056b3;
  color: white;
}

.github-icon, .project-icon {
  font-size: 20px;
}

.back-link {
  margin-top: 30px;
}

.back-btn {
  display: inline-block;
  padding: 10px 20px;
  background-color: #6c757d;
  color: white;
  text-decoration: none;
  border-radius: 5px;
  transition: background-color 0.3s;
}

.back-btn:hover {
  background-color: #545b62;
  color: white;
}
</style>