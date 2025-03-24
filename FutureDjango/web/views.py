# web/views.py
from django.shortcuts import render
from web import models

def population_list(request):
    population_queryset = models.Population.objects.all()
    return render(request, "sheet1.html", {"population_queryset": population_queryset})