from django.shortcuts import render, get_object_or_404
from .models import Article, Products
from .serializers import ArticleSerializer, ProductSerializer ,FavoritesSerializer
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from rest_framework import mixins
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Favorites
from rest_framework.decorators import api_view
from login.models import T_User
from django.db import connection

class ArticleViewSet(viewsets.ModelViewSet):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Products.objects.all()
    serializer_class = ProductSerializer


def get_products_by_type(request, product_type):
    try:
        products = Products.objects.filter(Type=product_type)
        serialized_data = []
        for product in products:
            serialized_data.append({
                'id': product.id,
                'names': product.names,
                'prices': product.prices,
                'brand': product.brand,
                'Type': product.Type,
                'images': product.images
            })
        return JsonResponse(serialized_data, safe=False)
    except Products.DoesNotExist:
        return JsonResponse([], safe=False)


def get_products_by_brand(request, product_brand):
    try:
        products = Products.objects.filter(brand=product_brand)
        serialized_data = []
        for product in products:
            serialized_data.append({
                'id': product.id,
                'names': product.names,
                'prices': product.prices,
                'brand': product.brand,
                'Type': product.Type,
                'images': product.images
            })
        return JsonResponse(serialized_data, safe=False)
    except Products.DoesNotExist:
        return JsonResponse([], safe=False)



@api_view(['POST'])  # Use POST method to add to favorites
def add_to_favorites(request, user_id, product_id):

    # Check if the user exists, you can use User model from Django auth or your custom User model

    user = get_object_or_404(T_User, U_Id=user_id)

    # Check if a record with the same combination of user and product_id already exists
    existing_favorite = Favorites.objects.filter(user=user_id, product_id=product_id).first()
    print("   Existing   Favorite     :     ", existing_favorite)
    if existing_favorite:
        existing_favorite.delete()
        return Response({"detail": "This item is already in your favorites."}, status=status.HTTP_400_BAD_REQUEST)
    with connection.cursor() as cursor:
            cursor.execute("SET FOREIGN_KEY_CHECKS=0")
    new_favorite = Favorites(user_id=user_id, product_id=product_id)
    new_favorite.save()
    print(new_favorite)
    return new_favorite
    
@api_view(['DELETE'])
def remove_from_favorites(request, user_id, product_id):
    # Check if the user exists
    user = get_object_or_404(T_User, id=user_id)
    
    # Check if a record with the specified user and product_id exists
    favorite = Favorites.objects.filter(user=user, product_id=product_id).first()
    
    if not favorite:
        return Response({"detail": "Item not found in favorites."}, status=status.HTTP_404_NOT_FOUND)
    
    favorite.delete()
    return Response({"detail": "Item removed from favorites."}, status=status.HTTP_204_NO_CONTENT)
    



def get_favorite_products(request):
    favorite_products = Favorites.objects.all()
    serializer = FavoritesSerializer(favorite_products, many=True)
    serialized_data = []
    for prod in serializer.data:
        prod_id=list(prod.values())[2]
        proo=Products.objects.get(pk=prod_id)
        print("azerazer :      ",proo.brand)
        serialized_data.append({
                'id': proo.id,
                'name': proo.names,
                'price': proo.prices,
                'brand': proo.brand,
                'Type': proo.Type,
                'image': proo.images,
                'Link':proo.Link,
            })
    print("serializer :     " , serialized_data)
    return JsonResponse(serialized_data, safe=False)
