from django.urls import path

from .api import info
from . import views

urlpatterns = [
    # 添加请求路由，访问vues时会将请求交给模板下urls路由
    path('info/', info.vuesInfo, name='info'),
    path('register/', views.register, name='register'),
]