# index/urls.py
from django.urls import path
from . import views

app_name = 'index'

urlpatterns = [
    path('', views.IndexView.as_view(), name='indexpage'),
    path('bat_test/', views.BarChartView.as_view(), name='test1'),
    # name 代表其代号
]

