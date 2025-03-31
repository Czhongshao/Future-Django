from django.urls import path

from .api import populationAPI

urlpatterns = [
    # 添加请求路由，访问vues时会将请求交给模板下urls路由
    path('api/', populationAPI.populationAPI, name='populationAPI'),
]