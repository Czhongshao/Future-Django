# 项目创建流程

## Django项目创建流程

### 一、通过命令行创建标准的Django项目

1. 找到想要存放项目的文件通过命令行 ==***django-admin startproject 项目名称***==
2. 通过命令 ==***tree /F***== 得到当前的文件结构

```markdown
#### 以下是得到的默认项目文件结构
└─DjangoFor4C
    ├─manage.py     【关键：项目管理、启动项目、创建app、数据管理】
    │
    └─DjangoFor4C     【与项目名称相同】
        ├─ asgi.py    【接收网络请求】
        ├─ settings.py   【**项目配置文件**】    【经常需要操作】
        ├─ urls.py    【**URL和函数的对应关系**】 【经常需要操作】
        ├─ wsgi.py    【接收网络请求】
        └─ __init__.py
```

### 二、APP

```markdown
-项目
 - app，用户管理 【表结构、函数、HTML模板、CSS】
 - app，订单管理 【表结构、函数、HTML模板、CSS】
 - app，后台管理 【表结构、函数、HTML模板、CSS】
 - app，某网站   【表结构、函数、HTML模板、CSS】
 - app，API   【表结构、函数、HTML模板、CSS】
 ··
 
注意：开发简洁的情况下不需要创建多app，一般项目下只需要创建一个app
```

#### 创建app应用

1. cd进入该项目，新建对应的app应用 ==***python manage.py startapp app名称***== 【注意，app名称不能和django原有的app名称相同，会报错】

```markdown
#### 以下是拥有一个app的情况下的项目文件结构
└─DjangoFor4C
    ├─ manage.py
    │
    ├─app1      【app的名称】
    │  ├─ admin.py    【固定，不要修改】   【django默认提供的admin后台管理】
    │  ├─ apps.py    【固定，不需要修改】 【app启动类】
    │  ├─ models.py    【**关键**】    【对数据库操作】
    │  ├─ tests.py    【固定，不要修改】   【进行项目的单元测试】
    |  └─ migrations   【固定，不要修改】   【数据库字段变更记录】  
    │  │  └── __init__.py  
    │  ├─ views.py    【**关键**】    【视图函数等】
    │  └─ __init__.py
    │  
    │
    └─DjangoFor4C  
        ├─ asgi.py 
        ├─ settings.py
        ├─ urls.py    【URL-->函数】
        ├─ wsgi.py 
        └─ __init__.py
```

### 三、快速配置

#### 1、注册app 【DjangoFor4C/settings.py】

1. 在 ==***DjangoFor4C/settings.py***== 文件当中，找到INSTALLED_APPS，并在其中添加创建的app
2. ==***app1***== 或者是 ==***app1.apps.App1Config***== 均可

#### 2、编写URL和视图函数对应关系

- ```python
  # DjangoFor4C/urls.py
  from django.contrib import admin
  from django.urls import path
  from app1 import views #【**需要从app当中导入views模块**】
  
  urlpatterns = [
      # path('admin/', admin.site.urls), # 默认的路径关系, 可以不用
  
      # www.xxx.com/index/  --> 函数
      path('index/', views.index), # 注意，路径后面最好多加一个/
      path('users/list/', views.users_list),
  ]
  ```

  - index/：网址的路径，比如（www.xxx.com/index/）
  - views.index：index视图函数

- ```python
  # app1/views.py
  from django.shortcuts import render, HttpResponse
  
  def index(request): # 默认参数设置为request
      return HttpResponse("初次见面！")
  
  def users_list(request):
      return render(request, "users_list.html") # 这段在后续templates时会提到
  ```

#### 3、启动Django项目

- 命令行启动

  ```cmd
  python manage.py runserver
  
  # 可能报错如下
  `
  You have 18 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, sessions.
  Run 'python manage.py migrate' to apply them.
  `
  # 那么先运行 python manage.py migrate ，再运行上述启动命令即可
  ```

- 访问链接

  ```cmd
  http://127.0.0.1:8000/
    
  # 此时会发现404无法访问，那是因为我们只设置了index界面，即访问链接应该改成如下
    
  http://127.0.0.1:8000/index/
  或者
  localhost:8000/index/
  ```

### 四、templates模板的使用

- 在app1文件夹下新建一个 ==***templates***== 文件夹，用于存放html模板

  - 在该文件夹下新建一个html文件，命名为==***users_list.html***==

  - 同时在 ==***app1/views.py***== 写入函数

    ```python
    def users_list(request):
        # 默认去"app1/"路径下寻找"templates/"当中的html文件
        # 根据app的注册顺序【DjangoFor4C/setting.py当中的APP顺序】，逐一去"templates"当中找
     return render(request, "users_list.html")
    ```

  - 在 ==***DjangoFor4C/urls***== 中写入path

    ``` pyhton
    path('users/list/', views.users_list)
    ```

  - 如果根目录下有templats文件夹，并且在 ==***DjangoFor4C/settings.py***==  当中设置了TEMPLATES的DIRS

    ```python
    import os
    TEMPLATES = [
        {
            'BACKEND': 'django.template.backends.django.DjangoTemplates',
             # DIRS不填写就默认根据顺序查找templates
             # 填写如下就会优先在根目录的templates当中查找，再根据注册顺序查找
            'DIRS': [os.path.join(BASE_DIR, 'templates')], 
            'APP_DIRS': True,
      ······ # 省略
        },
    ]
    ```

### 五、static静态文件的使用

- 在app下新建static文件夹

  - static文件夹内再新建以下文件夹，用于存放静态文件

    ```txt
    css
    js
    plugins
    img
    ```

- 在 **==*app1/templates/users_add.html*==** 当中引用静态资源时候需要在最顶上加上一句：

  ```html
  {% load static %}
  ```

  并且静态资源引用方式改为如：

  ```html
  <!-- 方法1 -->
  <img src="{% static 'img/1.png' %}"  alt=""/>
  <!-- 方法2 -->
  <img src="/static/img/1.png" alt="">
  ```

  但上面两个方法都存在弊端:

  1. 在vscode当中均无法通过ctrl+点击的方式索引到对应的文件

  2. 在pycharm当中只有方法1能够索引到对应文件

     **不过两者都不影响浏览器上的正常使用显示**

- 放入静态文件

  ==***分别是 bootstrap-5.1.0、jquery-3.7.0.min.js***==

  ```markdown
  #### 当前的app1文件结构
  └─app1
      │  admin.py
      │  apps.py
      │  models.py
      │  tests.py
      │  views.py
      │  __init__.py
      │
      ├─migrations
      │  └─ __init__.py
      │
      ├─static
      │  ├─css
      │  ├─img
      │  │ └─ 1.png
      │  │
      │  ├─js
      │  │ └─ jquery-3.7.0.min.js
      │  │
      │  └─plugins
      │      └─ bootstrap-5.1.0-dist
      │          │
      │          ├─css
      |     | └─(省略)
      │          │
      │          └─js
      │    └─(省略)
      ├─templates
      │      users_add.html
      │      users_list.html
  ```

- 可能需要微调修改？

  在 **==*DjangoFor4C/settings.py*==** 文件当中修改 ==***STATIC_URL = '/static/'***== 可能会解决图片无法显示的问题

## Django项目后端建立流程

### 一、通过命令行创建app

```cmd
python manage.py startapp population

此时的到的文件结构如下
population/
│  admin.py
│  apps.py
│  models.py
│  tests.py
│  urls.py
│  views.py
│  __init__.py
│
├─api
│      populationAPI.py
│
└─migrations
        __init__.py
```

**注意此时需要去`settings.py`当中修改注册app**  
</br>

### 数据库迁移

#### mysql 用户认证方法

`pip install cryptography`

#### 数据库迁移至model

```markdown
*将在数据库的表中生成对应的`model`代码，并且打印出来*
`python manage.py inspectdb`

*将数据库当中的所有表导入`population`app下的`models.py`当中*
`python manage.py inspectdb > population/models.py`

*将数据库中的`provinces`表导入`population`app下的`models.py`当中*
`python manage.py inspectdb provinces > population/models.py`

*将数据库中的`provinces`|`population_data`表导入`population`app下的`models.py`当中*
`python manage.py inspectdb --database default provinces population_data > population/models.py`
```

#### 数据库更新

```markdown
python manage.py makemigrations

python manage.py migrate
```

## Vue3项目创建流程

### 一、创建命令

- npm init vue@latest
- 默认命名后回车即可
- cd django-vue
- 进入项目文件
- npm install
- 装载依赖文件
- npm run dev
- 启动开发服务器

```markdown
#### 一个标准的vue项目文件排布
django-vue/
│  .gitignore
│  index.html
│  jsconfig.json
│  package-lock.json
│  package.json
│  README.md
│  vite.config.js
│
├─node_modules/
│
├─.vscode
│      extensions.json
│      settings.json
│
├─public
│      favicon.ico
│
└─src
    │  App.vue
    │  main.js
    │
    ├─api/                            # 存放与后端API交互的文件
    ├─assets                          # 存放静态资源文件的目录，图片或字体
    │      base.css
    │      logo.svg
    │      main.css
    │
    ├─components                      # 存放Vue 组件文件的目录
    │  │  HelloWorld.vue
    │  │  TheWelcome.vue
    │  │  WelcomeItem.vue
    │  │
    │  └─icons
    │          IconCommunity.vue
    │          IconDocumentation.vue
    │          IconEcosystem.vue
    │          IconSupport.vue
    │          IconTooling.vue
    │
    ├─router/                         # 存放Vue Router 相关的文件，用于配置路由
    ├─store/                          # 存放Vuex 相关的文件，用于状态管理
    └─views/                          # 存放路由组件文件的目录，通常用于不同路由对应的页面组件
```

### 二、安装插件

#### 1.安装路由插件

- npm install vue-router
- npm install @vitejs/plugin-vue

#### 2.建立流程

1. 定义视图函数(view)

    ```vue
    <!-- django-vue/src/views/index.vue -->
    <template>
        <div>
            主页index索引界面
        </div>
    </template>

    <script>
    export default {
        name: 'IndexView',
    }
    </script>

    <style>
    /* 此处添加页面样式内容 */
    </style>
    ```

2. 添加路由配置(router)

    ```js
    // django-vue/src/router/router.js
    import { createRouter,createWebHistory } from 'vue-router' //引入路由插件函数

    import IndexView from '@/views/index.vue' //引入被路由到的页面相关文件 

    // import PaasView from '@/views/paas.vue'
    // import LogView from "@/views/log.vue";
    
    const routes = [
        {
            path: '/',
            name: 'IndexView',
            component: IndexView
        },
        // 新增路由
        // {
        //     path: '/paas',
        //     name: 'PaasView',
        //     component: PaasView
        // },
    
        // {
        //     path: '/log',
        //     name: 'LogView',
        //     component: LogView
        // },

    ]
    
    // 创建路由
    const router = createRouter({
        history: createWebHistory(),
        routes
    });
    
    export default router
    ```

3. 注册路由(main.js)

    ```js
    // django-vue/src/main.js
    import { createApp } from 'vue'
    import App from './App.vue'
    
    const  app = createApp(App)
    import router from './router/router'
    app.use(router);  //注册路由
    
    app.mount('#app')
    ```

4. 清理App.vue视图

    ```vue
    <!-- django-vue/App.vue -->
    <template>
        <div>
            <router-view></router-view>
            <!-- 添加html跳转路由 -->
            <router-link to="/">主页index</router-link>
            <router-link to="/paas">paas界面</router-link>
            <router-link to="/log">log界面</router-link>
            <router-link to="/vues">vues界面</router-link>
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
    ```

5. vue调用后端接口(api)

    ```js
    // django-vue/src/api/vuesinfo.js
    export function vuesClusterInfo(method, params) {
    
        if (method === 'GET') {
            // 如果是GET请求，将参数拼接到URL上
            //url += '?' + new URLSearchParams(params).toString();
            return fetch('/vues/info/', {
                method: 'GET',  //可以是post请求 根据你后端逻辑判断即可
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok')
                    }
                    return response.json()
                });
        } else if (method === 'POST') {
            // 如果是POST请求，将参数放在请求体中
            return fetch('/vues/info/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(params)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok')
                    }
                    return response.json()
                });
        } else {
            throw new Error('Unsupported method')
        }
    }
    ```

6. 配置vite.config.js

    ```js
    import { fileURLToPath, URL } from 'node:url'
    import { defineConfig } from 'vite'
    import vue from '@vitejs/plugin-vue'
    import vueDevTools from 'vite-plugin-vue-devtools'


    export default defineConfig({
    plugins: [
        vue(),
        vueDevTools(),
    ],
    resolve: {
        alias: {
        '@': fileURLToPath(new URL('./src', import.meta.url)),
        },
    },
    server: {
        proxy: {
        '/vues': {
            target: 'http://localhost:8000', // 转发的目标地址
            changeOrigin: true, // 允许跨域
        }
        }
    }
    });
    ```
