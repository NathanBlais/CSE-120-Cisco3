"""cispro URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from pages.views import home_view, contact_view, connect_view, home_view
from product.views import prod_detail_view

from register import views as v

urlpatterns = [
    path('', home_view, name='home'),
    path('contact/', contact_view),
    path('connect/', connect_view),
    path('home/', home_view),
    path('prod/', prod_detail_view),
    path("register/", v.register, name="register"),
    path('admin/', admin.site.urls),
    path('', include("django.contrib.auth.urls")),
]
