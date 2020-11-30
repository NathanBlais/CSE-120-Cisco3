from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def home_view(request, *args, **kwargs):
	return render(request, "home.html", {})
	#return HttpResponse("<h1>Hello User</h1>")

def contact_view(request, *args, **kwargs):
	return render(request, "contact.html", {})
	#return HttpResponse("<h1>Contact Page</h1>")

def connect_view(request, *args, **kwargs):
	return render(request, "connect.html", {})

