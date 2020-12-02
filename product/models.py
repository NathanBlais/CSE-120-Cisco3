from django.db import models

# Create your models here.

class product(models.Model):
	title	= models.TextField()
	description = models.TextField()

