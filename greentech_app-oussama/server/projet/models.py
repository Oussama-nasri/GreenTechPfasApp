from django.db import models
from django.contrib.auth.models import User

class Article(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    def __str__(self):
        return self.title

class Products (models.Model):
    names =models.CharField(max_length=200)
    images=models.CharField(max_length=200)
    descriptions=models.CharField(max_length=2000)
    ingredients=models.CharField(max_length=2000)
    brand=models.CharField(max_length=200)
    prices=models.CharField(max_length=200)
    Type=models.CharField(max_length=200)
    Link=models.CharField(max_length=200)

class Favorites(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.CharField(max_length=200)  # Assuming product_id is a string field


# Instanciation de l'objet Article et du serializer


# Impression de la représentation du serializer

