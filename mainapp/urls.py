from django.urls import path

from . import views

urlpatterns = [
    path('text_to_image', views.text_to_image, name='text_to_image'),
    # path('dashboard', views.employee_list, name='employee_list'),
    # path('new_employee', views.new_employee, name='new_employee'),
]