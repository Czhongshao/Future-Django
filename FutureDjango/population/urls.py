# population/urls.py
from django.urls import path

from .api.populationAPI import populationAPI  # 确保正确导入

urlpatterns = [
    path('api/', populationAPI, name='populationAPI'),
]