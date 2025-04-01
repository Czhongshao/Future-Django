from django.urls import path

from .api import info
from . import views

urlpatterns = [
    
    path('info/', info.vuesInfo, name='info'),
    path('register/', views.register, name='register'),
]