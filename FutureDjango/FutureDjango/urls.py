# FutureDjango/urls.py
from django.contrib import admin
from django.urls import path, include
# from web import views

urlpatterns = [
    path('', include('index.urls', namespace='index')),
    path('admin/', admin.site.urls),
    # path('population/', views.population_list, name='population_list'),
]