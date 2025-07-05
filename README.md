# Future-Django 项目

一个基于 Django + Vue3 的全栈数据可视化项目，用于展示人口和GDP等统计数据。

## 📋 目录

- [项目概述](#项目概述)
- [技术栈](#技术栈)
- [项目结构](#项目结构)
- [快速开始](#快速开始)
- [Django 后端开发](#django-后端开发)
- [Vue3 前端开发](#vue3-前端开发)
- [数据库配置](#数据库配置)
- [部署说明](#部署说明)

## 🎯 项目概述

本项目是一个数据可视化平台，主要功能包括：

- 人口数据展示和分析
- GDP数据可视化
- 省份数据统计
- 交互式图表展示

## 🛠 技术栈

### 后端

- **Django 4.x** - Web框架
- **Django REST Framework** - API开发
- **MySQL** - 数据库
- **Python 3.8+** - 编程语言

### 前端

- **Vue 3** - 前端框架
- **Vue Router** - 路由管理
- **ECharts** - 数据可视化
- **Vite** - 构建工具

## 📁 项目结构

```
Future-Django/
├── Datas/                    # 原始数据文件
├── Datas_Out/               # 处理后的数据输出
├── django-vue/              # Vue3前端项目
│   ├── src/
│   │   ├── api/            # API接口
│   │   ├── components/     # Vue组件
│   │   ├── views/          # 页面视图
│   │   └── router/         # 路由配置
│   └── public/             # 静态资源
├── FutureDjango/           # Django后端项目
│   ├── index/             # 主应用
│   ├── population/        # 人口数据应用
│   ├── vues/             # Vue相关应用
│   └── manage.py         # Django管理脚本
└── README.md
```

## 🚀 快速开始

### 环境要求

- Python 3.8+
- Node.js 16+
- MySQL 8.0+

### 1. 克隆项目

```bash
git clone https://github.com/Czhongshao/Future-Django.git
cd Future-Django
```

### 2. 后端设置

```bash
# 进入Django项目目录
cd FutureDjango

# 安装Python依赖
pip install -r requirements.txt

# 配置数据库（见数据库配置部分）

# 运行数据库迁移
python manage.py makemigrations
python manage.py migrate

# 启动Django服务器
python manage.py runserver
```

### 3. 前端设置

```bash
# 进入Vue项目目录
cd django-vue

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

### 4. 访问应用

- 后端API: http://localhost:8000
- 前端页面: http://localhost:5173

## 🐍 Django 后端开发

### 创建Django项目

```bash
# 创建Django项目
django-admin startproject FutureDjango

# 查看项目结构
tree /F
```

**默认项目结构：**

```
FutureDjango/
├── manage.py              # 项目管理脚本
└── FutureDjango/          # 项目配置目录
    ├── __init__.py
    ├── asgi.py           # ASGI配置
    ├── settings.py       # 项目设置
    ├── urls.py           # URL配置
    └── wsgi.py           # WSGI配置
```

### 创建应用

```bash
# 进入项目目录
cd FutureDjango

# 创建应用
python manage.py startapp population
```

**应用结构：**

```
population/
├── __init__.py
├── admin.py              # 后台管理配置
├── apps.py               # 应用配置
├── models.py             # 数据模型
├── tests.py              # 测试文件
├── views.py              # 视图函数
├── api/                  # API接口
│   └── populationAPI.py
└── migrations/           # 数据库迁移文件
    └── __init__.py
```

### 应用配置

#### 1. 注册应用

在 `settings.py` 中添加应用：

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'population',  # 添加你的应用
]
```

#### 2. URL配置

在 `urls.py` 中配置路由：

```python
from django.contrib import admin
from django.urls import path
from population import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/population/', views.population_data),
    path('index/', views.index),
]
```

#### 3. 视图函数

在 `views.py` 中编写视图：

```python
from django.shortcuts import render
from django.http import JsonResponse

def index(request):
    return render(request, 'index.html')

def population_data(request):
    # 返回人口数据
    data = {
        'message': '人口数据',
        'data': []
    }
    return JsonResponse(data)
```

### 模板和静态文件

#### 模板配置

在应用目录下创建 `templates` 文件夹：

```
population/
├── templates/
│   └── index.html
```

在 `settings.py` 中配置模板目录：

```python
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
```

#### 静态文件配置

在应用目录下创建 `static` 文件夹：

```
population/
├── static/
│   ├── css/
│   ├── js/
│   ├── img/
│   └── plugins/
```

在模板中使用静态文件：

```html
{% load static %}
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="{% static 'css/style.css' %}">
</head>
<body>
    <img src="{% static 'img/logo.png' %}" alt="Logo">
    <script src="{% static 'js/main.js' %}"></script>
</body>
</html>
```

## ⚡ Vue3 前端开发

### 创建Vue项目

```bash
# 创建Vue项目
npm init vue@latest django-vue

# 进入项目目录
cd django-vue

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

### 项目结构

```
django-vue/
├── public/
│   └── favicon.ico
├── src/
│   ├── api/              # API接口
│   ├── assets/           # 静态资源
│   ├── components/       # 组件
│   ├── router/           # 路由
│   ├── views/            # 页面
│   ├── App.vue           # 根组件
│   └── main.js           # 入口文件
├── package.json
└── vite.config.js        # Vite配置
```

### 安装依赖

```bash
# 路由
npm install vue-router

# 图表库
npm install echarts vue-echarts

# 其他工具
npm install axios
```

### 路由配置

```javascript
// src/router/index.js
import { createRouter, createWebHistory } from 'vue-router'
import IndexView from '@/views/IndexView.vue'

const routes = [
  {
    path: '/',
    name: 'Index',
    component: IndexView
  },
  {
    path: '/population',
    name: 'Population',
    component: () => import('@/views/PopulationView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
```

### API配置

```javascript
// src/api/population.js
export function getPopulationData() {
  return fetch('/api/population/', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then(response => response.json())
}
```

### Vite代理配置

```javascript
// vite.config.js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:8000',
        changeOrigin: true
      }
    }
  }
})
```

## 🗄 数据库配置

### MySQL配置

#### 1. 安装依赖

```bash
pip install mysqlclient cryptography
```

#### 2. 数据库设置

在 `settings.py` 中配置数据库：

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'your_database_name',
        'USER': 'your_username',
        'PASSWORD': 'your_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

#### 3. 数据库迁移

```bash
# 从现有数据库生成模型
python manage.py inspectdb > population/models.py

# 创建迁移文件
python manage.py makemigrations

# 应用迁移
python manage.py migrate
```

### 数据导入

```bash
# 导入特定表
python manage.py inspectdb provinces > population/models.py

# 导入多个表
python manage.py inspectdb --database default provinces population_data > population/models.py
```

## 🚀 部署说明

### 生产环境配置

1. **Django设置**

   - 修改 `DEBUG = False`
   - 配置 `ALLOWED_HOSTS`
   - 设置静态文件路径
2. **数据库配置**

   - 使用生产环境数据库
   - 配置数据库连接池
3. **前端构建**

   ```bash
   npm run build
   ```

### 常用命令

```bash
# Django管理
python manage.py runserver          # 启动开发服务器
python manage.py makemigrations     # 创建迁移文件
python manage.py migrate            # 应用迁移
python manage.py collectstatic      # 收集静态文件

# Vue开发
npm run dev                         # 启动开发服务器
npm run build                       # 构建生产版本
npm run preview                     # 预览构建结果
```

## 📝 注意事项

1. **应用命名**：避免使用Django内置应用名称
2. **静态文件**：确保正确配置静态文件路径
3. **跨域问题**：配置CORS或使用代理
4. **数据库**：定期备份重要数据
5. **安全**：生产环境中保护敏感信息

## 🤝 贡献指南

1. Fork 项目
2. 创建功能分支
3. 提交更改
4. 推送到分支
5. 创建 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。
