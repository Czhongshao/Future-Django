# index/urls.py
from django.urls import path
from . import views

app_name = 'index'

urlpatterns = [
    path('', views.IndexView.as_view(), name='indexpage'),
    path('BarAll/', views.BarChartView.as_view(), name='barall'),
    # name 代表其代号
    path('LineAll/', views.LineChartView.as_view(), name='lineall'),
    path('PieAll/', views.PieChartView.as_view(), name='pieall'),
    path('ScatterAll/', views.ScatterChartView.as_view(), name='scatterall'),
    path('MappAll/', views.MapChartView.as_view(), name='mapall'),
]

