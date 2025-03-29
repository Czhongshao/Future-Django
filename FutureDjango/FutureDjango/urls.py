# FutureDjango/urls.py
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('', include('index.urls', namespace='index')),
    path('admin/', admin.site.urls),
]