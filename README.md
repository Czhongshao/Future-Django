# Future-Django 项目

基于 **Django + Vue3** 的全栈数据可视化平台，聚焦人口、GDP等统计数据的展示与分析。

---

## 📋 目录

- [项目简介](#项目简介)
- [技术栈](#技术栈)
- [项目结构](#项目结构)
- [快速开始](#快速开始)
- [后端开发（Django）](#后端开发django)
- [前端开发（Vue3）](#前端开发vue3)
- [数据库配置](#数据库配置)
- [部署说明](#部署说明)
- [注意事项](#注意事项)
- [贡献指南](#贡献指南)
- [许可证](#许可证)

---

## 🎯 项目简介

本项目为数据可视化平台，主要功能包括：

- 人口与GDP等多维度数据的可视化展示
- 省份/地区统计与对比分析
- 交互式图表与数据探索

---

## 🛠 技术栈

**后端：**

- Django 4.x
- Django REST Framework
- MySQL 8.0+
- Python 3.8+

**前端：**

- Vue 3
- Vue Router
- ECharts
- Vite
- Axios

---

## 📁 项目结构

```
Future-Django/
├── Datas/                # 原始数据文件
├── Datas_Out/            # 处理后数据输出
├── django-vue/           # Vue3 前端项目
│   ├── src/              # 前端源码
│   ├── public/           # 前端静态资源
│   └── ...               # 依赖、配置等
├── FutureDjango/         # Django 后端项目
│   ├── index/            # 主应用
│   ├── population/       # 人口数据应用
│   ├── vues/             # Vue相关后端应用
│   ├── staticfiles/      # 后端静态文件
│   └── manage.py         # 管理脚本
└── README.md
```

---

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

### 2. 后端启动

```bash
cd FutureDjango
pip install -r requirements.txt
# 配置数据库（见下文）
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```

### 3. 前端启动

```bash
cd django-vue
npm install
npm run dev
```

### 4. 访问地址

- 后端API: http://localhost:8000
- 前端页面: http://localhost:5173

---

## 🐍 后端开发（Django）

- 项目结构清晰，推荐每个功能模块单独建 app（如 population、index、vues）。
- API 推荐使用 Django REST Framework 编写，便于前后端分离。
- 静态文件、模板文件建议分别放在各自 app 的 static、templates 目录下。
- 详细开发说明见各 app 目录及注释。

---

## ⚡ 前端开发（Vue3）

- 采用 Vue3 + Vite，开发体验流畅。
- 组件、页面、API、路由等结构清晰，便于扩展。
- 推荐使用 ECharts 进行数据可视化，Axios 进行 API 通信。
- 代理配置已在 vite.config.js 中设置，开发时无需担心跨域。

---

## 🗄 数据库配置

1. 安装依赖：

   ```bash
   pip install mysqlclient cryptography
   ```
2. 修改 `FutureDjango/settings.py`：

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
3. 数据迁移：

   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```
4. 数据导入（如需从现有表生成模型）：

   ```bash
   python manage.py inspectdb > population/models.py
   ```

---

## 🚀 部署说明

1. **Django生产环境：**
   - `DEBUG = False`
   - 配置 `ALLOWED_HOSTS`
   - 设置静态文件路径
2. **数据库：**
   - 使用生产数据库，配置连接池
3. **前端：**
   - 构建生产版本：`npm run build`
   - 部署 dist 目录到 Web 服务器

---

## 📝 注意事项

- 避免 app 命名与 Django 内置应用冲突
- 静态文件路径需正确配置
- 跨域问题建议用 CORS 或前端代理
- 定期备份数据库
- 生产环境注意保护敏感信息

---

## 🤝 贡献指南

1. Fork 本项目
2. 创建功能分支
3. 提交更改
4. 推送到分支
5. 创建 Pull Request

---

## 📄 许可证

本项目采用 MIT 许可证，详见 [LICENSE](LICENSE)。

---

如需详细开发文档或遇到问题，欢迎提 Issue 或联系作者！
