from django.urls import path,include
from . import views
from rest_framework.routers import DefaultRouter
from .views import get_products_by_type
from .views import get_products_by_brand
from .views import add_to_favorites

router =DefaultRouter()
router.register('articles',views.ArticleViewSet,basename='articles')
router.register('products',views.ProductViewSet,basename='products')
urlpatterns = [
  #path('articles',views.ArticleList.as_view()),
  #path('articles/<int:pk>',views.ArticleDetails.as_view())
  path('',include(router.urls)),
  path('products/type/<str:product_type>/', get_products_by_type, name='get_products_by_type'),
  path('products/brand/<str:product_brand>/', get_products_by_brand, name='get_products_by_brand'),
  path('favorites/get', views.get_favorite_products, name='get_favorite_products'),
  path('add-to-favorites/<int:user_id>/<str:product_id>/', views.add_to_favorites, name='add_to_favorites'),
  path('remove-from-favorites/<int:user_id>/<str:product_id>/', views.remove_from_favorites, name='remove_from_favorites'),
]