import React, { useState, useEffect } from 'react';
import { View, Text, Image, FlatList ,Card,StyleSheet,TouchableHighlight,SafeAreaView , } from 'react-native';
import { useNavigation } from '@react-navigation/native';

const FavoriteProducts = () => {
  const [favoriteProducts, setFavoriteProducts] = useState([]);
  const navigation = useNavigation();

  const styles = StyleSheet.create({
    
    cardStyle: {
      paddingTop: 0,
      paddingHorizontal:35,
      //justifyContent: 'center',
      //alignItems: 'center',
      zIndex: 100,
      flexDirection: 'row', 
      alignItems: 'center', 
      borderRadius:15,
      backgroundColor:'white',
      marginBottom:5,
      elevation: 20,
    shadowColor: '#B2B2B2 ',
    },
    imageStyle: {
      width: 100,
      height: 100,
      marginHorizontal: -30,
      borderRadius:20,
    },

    FavText:{
      paddingTop: 15,
      paddingHorizontal:20,
      fontSize:24,
      fontWeight:'bold',
      marginBottom:5,
      
    },
    NameStyle:{
      marginHorizontal: -20,
      fontSize:14,
      textAlign: 'center',

    },
    PriceStyle:{
      marginHorizontal: -20,
      fontSize:14,
      textAlign: 'right',
      
    },
    TypeStyle:{
      marginHorizontal: -20,
      fontSize:14,
      textAlign: 'center',

    },
    BrandStyle:{
      marginHorizontal: -20,
      fontSize:14,
      textAlign: 'center',

      
    },
    infoContainer: {
      flex: 1, 
      marginLeft: 50,
    },
  });



  useEffect(() => {
    fetchFavoriteProducts();
  }, []);

  const fetchFavoriteProducts = async () => {
    try {
      const response = await fetch('http://192.168.1.19:8000/favorites/get');
      const data = await response.json();
      console.log('Fetched data:', data); // Log the data
      setFavoriteProducts(data);
      
    } catch (error) {
      console.error('Error fetching favorite products:', error);
    }
  };

  const clickedItem = (item,admin) => {
    navigation.navigate('Details', { data: item, admin: admin });
  };

  const renderProductItem = ({ item ,admin}) => (
    
    <TouchableHighlight onPress={() => clickedItem(item, admin)} underlayColor="transparent" >

        <View style={styles.cardStyle}>

        <Image source={{ uri: item.image }} style={styles.imageStyle} />
        <View style={styles.infoContainer}>
        <Text style={styles.NameStyle}>{item.name}</Text>
        <Text style={styles.BrandStyle}>{item.brand}</Text>
        <Text style={styles.TypeStyle}>{item.Type}</Text>
        <Text style={styles.PriceStyle}>{item.price}</Text>
        </View>

        </View>
       </TouchableHighlight>
  );
  

  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: '#E8EAED' }} >

      <Text style={styles.FavText}>Your Favorites</Text>
      <FlatList
        data={favoriteProducts}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item,admin }) => renderProductItem({ item, admin })}
      />

    </SafeAreaView>
  );
  


  
};

export default FavoriteProducts;
