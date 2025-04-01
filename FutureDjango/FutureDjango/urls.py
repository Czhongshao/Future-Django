# FutureDjango/urls.py
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views

# urlpatterns = [
#     path('', include('index.urls', namespace='index')), # 前后端不分离索引界面
#     path('admin/', admin.site.urls),
# ]

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/login/'), name='logout'),
    path('', include('population.urls')),  # 包含 population 应用的路由
]