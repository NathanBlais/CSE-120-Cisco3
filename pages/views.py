from django.shortcuts import render
from django.http import HttpResponse
from wgprivnet.WGinstance import WireGuard

from .forms import UserForm

# Create your views here.
def home_view(request, *args, **kwargs):
	return render(request, "home.html", {})
	#return HttpResponse("<h1>Hello User</h1>")

def contact_view(request, *args, **kwargs):
	return render(request, "contact.html", {})
	#return HttpResponse("<h1>Contact Page</h1>")

def connect_view(request, *args, **kwargs):
	if request.method == 'GET' and 'list_peers_get' in request.GET:
		wg = WireGuard()
		list_peers_string = wg.list_peers().stdout.decode("utf-8")
		return HttpResponse(list_peers_string)

	elif request.method == 'POST' and 'list_peers' in request.POST:
		wg = WireGuard()
		list_peers_string = wg.list_peers().stdout.decode("utf-8")
		return render(request, "connect.html", {})

	elif request.method == 'POST' and 'remove_client' in request.POST:
		wg = WireGuard()
		form = UserForm(request.POST)
		removeid = request.POST.get('userinput', None)
		wg.remove_client(removeid)
		return render(request, "connect.html", {})

	#elif request.method == 'POST' and 'change_DNS' in request.POST:
                #wg = WireGuard()
                #wg.change_dns()
                #return render(request, "connect.html", {})

	elif request.method == 'POST' and 'make_client_config' in request.POST:
                wg = WireGuard()
                form = UserForm(request.POST)
                addclient = request.POST.get('userinput')
                print(addclient)

                wg.make_client_config(addclient)
                return render(request, "connect.html", {})

	elif request.method == 'POST' and 'login' in request.POST:
                wg = WireGuard()
                wg.login()
                return render(request, "connect.html", {})


	else:
		return render(request, "connect.html", {})

