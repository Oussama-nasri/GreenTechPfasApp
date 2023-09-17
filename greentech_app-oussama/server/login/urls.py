from django.urls import re_path
from login import views

urlpatterns = [
    re_path(r'^login/$', views.check_login),
    re_path(r'^userid/([0-9]+)$', views.get_User),
    re_path(r'^user/$', views.V_Crud_User),
]