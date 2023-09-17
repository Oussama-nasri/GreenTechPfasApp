from rest_framework import serializers
from .models import Article
from .models import Products
from rest_framework.views import APIView
from rest_framework.response import Response


class ArticleSerializer(serializers.ModelSerializer):
    class Meta :
        model=Article
        fields =['id','title','description']

class ProductSerializer(serializers.ModelSerializer):
    class Meta :
        model=Products
        fields =['id','images','names','descriptions','ingredients','brand','prices','Type','Link']

from rest_framework import serializers
from .models import Favorites

class FavoritesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Favorites
        fields = ['id', 'user', 'product_id']


    def create(self, validated_data):
        # Override the create method to handle saving the user automatically
        user = self.context['request'].user
        validated_data['user'] = user
        return super().create(validated_data)
