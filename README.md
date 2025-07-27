# Future-Django 项目

基于 **Django + Vue3** 的前后端分离数据可视化平台，聚焦人口、GDP等统计数据的展示与分析。

---

## 📋 目录

- 项目简介
- 技术栈
- 目录结构
- 快速开始
- 数据库初始化
- 后端说明
- 前端说明
- 部署建议
- 常见问题
- 贡献指南
- 许可证

---

## 🎯 项目简介

Future-Django 是一个前后端分离的全栈可视化平台，支持：

- 人口、GDP等多维度数据的可视化
- 省份/地区统计与对比分析
- 交互式图表与数据探索
- 前端与后端通过 RESTful API 通信

---

## 🛠 技术栈

- **后端**：Django 4.x、Django REST Framework、MySQL 8.0+、Python 3.8+
- **前端**：Vue 3、Vite、ECharts、Axios

---

## 📁 目录结构

```
Future-Django/
├── Datas/                # 原始数据
├── Datas_Out/            # 处理后数据（含 futuredjango.sql）
├── django-vue/           # Vue3 前端项目
│   ├── src/              # 前端源码
│   └── ...
├── FutureDjango/         # Django 后端项目
│   ├── index/            # 主应用
│   ├── population/       # 人口数据API
│   ├── vues/             # 其他API
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

### 2. 数据库一键导入

```bash
mysql -u your_username -p your_database_name < Datas_Out/futuredjango.sql
```

### 3. 后端启动（API服务+管理后台）

```bash
cd FutureDjango
pip install -r requirements.txt
# 修改 settings.py 数据库配置
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```

- 访问 http://localhost:8000/ 会自动跳转到 http://localhost:8000/admin/，输入管理员账号密码即可进入后台。
- API接口路径如 /api/population/、/api/gdp/。

### 4. 前端启动

```bash
cd django-vue
npm install
npm run dev
```

- 访问前端页面: http://localhost:5173

---

## 🗄 数据库配置说明

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

---

## 🐍 后端说明（Django API）

- 每个功能模块单独建 app（如 population、index、vues）。
- API 使用 Django REST Framework 编写，前后端通过 HTTP 接口交互。
- 根路径自动跳转到 /admin/，便于管理后台登录。
- 业务开发以 API 为主，前端通过 Axios 请求数据。

---

## ⚡ 前端说明（Vue3 独立部署）

- 采用 Vue3 + Vite，开发体验流畅。
- 组件、页面、API、路由结构清晰，便于扩展。
- 使用 ECharts 进行数据可视化，Axios 进行 API 通信。
- vite.config.js 已配置代理，开发时无需担心跨域。
- 生产环境建议将 dist 目录部署到独立 Web 服务器（如 Nginx、Apache、Vercel、Netlify 等）。

---

## 🚀 部署建议

1. **后端（Django API）**：
   - `DEBUG = False`
   - 配置 `ALLOWED_HOSTS`
   - 设置静态文件路径（如有API文档/后台管理需求）
2. **数据库**：
   - 使用生产数据库，配置连接池
3. **前端（Vue3）**：
   - 构建生产版本：`npm run build`
   - 将 dist 目录部署到 Web 服务器

---

## ❓ 常见问题

- 访问 http://localhost:8000/无内容？ → 已自动跳转到 /admin/，请用管理员账号登录。
- 数据库导入报错？→ 请确认 MySQL 版本为 8.0+，并检查 SQL 文件路径及权限。
- 前后端接口跨域？→ 开发环境已配置代理，生产环境建议后端允许 CORS 或前端同源部署。
- 其他问题欢迎提 Issue。

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
