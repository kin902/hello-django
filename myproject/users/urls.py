from django.urls import path
from . import views

# Declare app namespace
app_name = 'users'

urlpatterns = [
    path('register/', views.register_view, name='register'),
]
