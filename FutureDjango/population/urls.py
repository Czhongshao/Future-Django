# population/urls.py
from django.urls import path
from .views import populationAPI  # 确保正确导入

urlpatterns = [
    path('api/', populationAPI, name='populationAPI'),
]