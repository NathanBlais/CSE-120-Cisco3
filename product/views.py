from django.shortcuts import render

from .models import product
# Create your views here.

def prod_detail_view(request):
	obj = product.object.get(id=1)
	context = {
		'title': obj.title
	}
	return render(request, "prod/detail.html", context)
