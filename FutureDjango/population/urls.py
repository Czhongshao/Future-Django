# population/urls.py
from django.urls import path
# from .views import populationAPI, gdpAPI  # 确保正确导入
from .views import populationAPI, gdpAPI # 确保正确导入

urlpatterns = [
    path('api/population/', populationAPI, name='populationAPI'),
    path('api/gdp/', gdpAPI, name='gdpAPI'),
]