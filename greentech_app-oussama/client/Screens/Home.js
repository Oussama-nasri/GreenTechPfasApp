import React, { useEffect, useState } from 'react';
import { Button, FlatList, Image, StyleSheet, Text, TextInput, View, TouchableOpacity, ScrollView} from 'react-native';
import DropDownPicker from 'react-native-dropdown-picker';
import { Card, FAB } from 'react-native-paper';
import { Ionicons } from '@expo/vector-icons'; // Make sure you have expo installed for icons


const Home = ({ navigation, route }) => {
  //const { user_id } = route.params || { user_id: 0 };
  const { admin, connected } = route.params;
  const [data, setData] = useState([]);
  const [productsToShow, setproductsToShow] = useState([]);
  const [distinctTypes, setdistinctTypes] = useState([]);
  const [distinctBrands, setdistinctBrands] = useState([]);

  const [selectedType, setSelectedType] = useState();
  const [selectedBrand, setSelectedBrand] = useState();
  const [isOpen1, setIsOpen1] = useState(false);
  const [isOpen2, setIsOpen2] = useState(false);
  const [typesData, setTypesData] = useState([]);
  const [brandsData, setBrandsData] = useState([]);
  const [minPrice, setMinPrice] = useState('');
  const [maxPrice, setMaxPrice] = useState('');
  
  
  const handleTypeChange = (value) => {
    setSelectedType(value);
  };

  const handleBrandChange = (value) => {
    setSelectedBrand(value);
  };

  const handleMinPriceChange = (value) => {
    setMinPrice(value);
  };

  const handleMaxPriceChange = (value) => {
    setMaxPrice(value);
  };

  const loadData = () => {
    fetch('http://192.168.1.19:8000/products/', {
      method: 'GET',
    })
      .then((res) => res.json())
      .then((data) => {
        setData(data);
        setproductsToShow (data.slice(0, 6)); // Assuming "data" is your array of products
        setdistinctTypes ([...data.reduce((types, product) => {
          types.add(product.Type);
          //console.log(product.Type);
          return types;
        }, new Set())].slice(0,4));

        setdistinctBrands ([...data.reduce((brands, product) => {
          brands.add(product.brand);
          return brands;
        }, new Set())]);
        console.log(distinctTypes);
        console.log(distinctBrands);
        console.log("admin:"+admin);
        console.log("connected:"+connected);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    const distinctTypes = [...new Set(data.map((item) => item.Type))];
    const distinctBrands = [...new Set(data.map((item) => item.brand))];
    setTypesData(distinctTypes.map((type) => ({ label: type, value: type })));
    setBrandsData(distinctBrands.map((brand) => ({ label: brand, value: brand })));
  }, [data]);

  const clickedItem = (item) => {
    navigation.navigate('Details', { data: item, admin: admin });
  };

  const parsePrice = (price) => {
    // Remove the dollar sign and commas, and convert the remaining string to a number
    return parseFloat(price.replace('$', '').replace(',', '.'));
  };

  const filterData = () => {
    let filteredData = data;

    if (selectedType) {
      filteredData = filteredData.filter((item) => item.Type === selectedType);
    }

    if (selectedBrand){
      filteredData = filteredData.filter((item) => item.brand === selectedBrand);
    }

    if (minPrice) {
      filteredData = filteredData.filter((item) => parsePrice(item.prices) >= parsePrice(minPrice));
    }

    if (maxPrice) {
      filteredData = filteredData.filter((item) => parsePrice(item.prices) <= parsePrice(maxPrice));
    }

    return filteredData;
  };


  const addToFavorites = async (user_id,productId) => {
    try {
      const response = await fetch(`http://192.168.1.19:8000/add-to-favorites/${user_id}/${productId}/`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          // You may need to include authentication headers if required by your backend
          // 'Authorization': 'Bearer YourAccessToken',
        },
      })
      if (response.status === 201) {
        console.log('Product added to favorites.');
      } else if (response.status === 400) {
        const data = await response.json();
        console.log(data.message);
      }
    } catch (error) {
      console.error(error);
    }
  };

  const removeFromFavorites = async (productId) => {
    try {
      const response = await fetch(`https://your-django-backend-url/remove-from-favorites/?product_id=${productId}`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          // You may need to include authentication headers if required by your backend
          // 'Authorization': 'Bearer YourAccessToken',
        },
      });

      if (response.status === 200) {
        console.log('Product removed from favorites.');
      } else if (response.status === 404) {
        const data = await response.json();
        console.log(data.message);
      }
    } catch (error) {
      console.error(error);
    }
  };





  const renderItem = ({ item }) => (
    <Card key={item.id} style={styles.cardStyle} onPress={() => clickedItem(item)}>
      <Image source={{ uri: item.images }} style={styles.imageStyle} />
      <Text>{item.names}</Text>
      <Text>{item.prices}</Text>
      <Text>{item.brand}</Text>
      <Text>{item.Type}</Text>
    </Card>
  );


  const [searchText, setSearchText] = useState('');

  const handleInputChange = (text) => {
    setSearchText(text);
  };

  const handleSearch = () => {
    // Perform search logic with the 'searchText'
    console.log('Search text:', searchText);
  };


  
  
  return (
    <View style={styles.container}>
      <ScrollView vertical showsVerticalScrollIndicator={true}>

      
      <View style={styles.searchContainer}>
        <TextInput
          style={styles.searchInput}
          placeholder="Search"
          placeholderTextColor="#666"
          value={searchText}
          onChangeText={handleInputChange}
        />
        <TouchableOpacity style={styles.iconContainer} onPress={handleSearch}>
          <Ionicons name="ios-search" size={24} color="#666" />
        </TouchableOpacity>
      </View>
      <View style={styles.section}>
        <Text style={styles.subtitle}>Explore PFAS products</Text>
        <View style={styles.buttonsContainer}>
        {distinctTypes.map((type) => (
          <TouchableOpacity
            key={type} // Add a unique key to each button
            style={styles.button}
            onPress={() =>navigation.navigate("Catalogue",{admin:admin,connected:connected,type:type,brand:null})}
          >
            <Text>{type}</Text>
          </TouchableOpacity>
        ))}
      </View>
      </View>
      <View style={styles.section}>
        <Text style={styles.subtitle}>Popular Products</Text>
        <View style={styles.gridContainer}>
        {productsToShow.map((product) => (
  <TouchableOpacity key={product.id} style={styles.productCard} onPress={() => clickedItem(product)}>
    <Image source={{ uri: product.images }} style={styles.productImage} />
    <TouchableOpacity style={styles.favoriteIcon } onPress={() => addToFavorites(user_id,product.id)} > 
      <Ionicons name="ios-heart" size={24} color="pink" />

    </TouchableOpacity>
    <View>
      {/* Truncate the product name to a specific number of characters */}
      <Text style={styles.productName}>
        {product.names.length > 20 // Adjust the character limit as needed
          ? `${product.names.substring(0, 20)}...`
          : product.names}
      </Text>
      <View style={styles.productDetails}>
        <Text style={styles.productPrice}>{product.prices}</Text>
        <Ionicons name="ios-arrow-forward" size={18} color="black" />
      </View>
    </View>
  </TouchableOpacity>
))}

    </View>
      </View>
      <View style={styles.section}>
        <Text style={styles.subtitle}>Top brands</Text>
        <ScrollView
      horizontal
      showsHorizontalScrollIndicator={true}
      contentContainerStyle={styles.scrollView}
    >
      {distinctBrands.map((brand) => (
          <TouchableOpacity
            key={brand} // Add a unique key to each button
            style={styles.buttonBrand}
            onPress={() =>navigation.navigate("Catalogue",{admin:admin,connected:connected,type:null,brand:brand})}
          >
            <Text>{brand}</Text>
          </TouchableOpacity>
        ))}
    </ScrollView>
      </View>
     
      </ScrollView> 
      <View style={styles.footer}>
        <TouchableOpacity style={styles.footerIcon} onPress={() => navigation.navigate("Home",{admin:admin,connected:connected}) }>
          <Ionicons name="ios-home" size={24} color="black" />
        </TouchableOpacity>
        <TouchableOpacity style={styles.footerIcon} onPress={() => navigation.navigate("Catalogue",{admin:admin,connected:connected,type:null,brand:null}) }>
          <Ionicons name="ios-list" size={24} color="black" />
        </TouchableOpacity>
        <TouchableOpacity style={styles.footerIcon} onPress={() => navigation.navigate("favorite") }>
          <Ionicons name="ios-heart" size={24} color="black" />
        </TouchableOpacity>
        <TouchableOpacity style={styles.footerIcon} onPress={() => navigation.navigate("Chatbot",{connected:connected}) }>
        <Image source={require('../assets/logo.png')} style={{ width: 28, height: 28 }}  />
        </TouchableOpacity>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: '2%',
    backgroundColor: '#ffffff',
  },
  searchContainer: {
    width: '97%',
    height: 56,
    top: '5%',
    left: '2%',
    padding: 16,
    borderRadius: 10,
    borderWidth: 2,
    borderColor: '#CDB1EC',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    backgroundColor: 'white',
  },
  gridContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
    paddingHorizontal: 16,
  },
  searchInput: {
    flex: 1,
    fontSize: 16,
  },
  iconContainer: {
    width: 24,
    height: 24,
    justifyContent: 'center',
    alignItems: 'center',
  },
  section: {
    marginTop: '5%',
    paddingHorizontal: '5%',
    borderRadius: 10,
    paddingVertical: '5%',
    shadowColor: '#F3E8FF',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.4,
    shadowRadius: 4,
    elevation: 3,
  },
  subtitle: {
    fontWeight: '700',
    fontSize: 20,
    lineHeight: 27,
    letterSpacing: 0.1,
    color: '#28222F',
    marginBottom: '5%',
  },
  buttonsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    flexWrap: 'wrap', // Allow wrapping to next row
  },
  button: {
    width: '48%',
    height: 80,
    marginBottom: '5%', // Add margin to create space between rows
    borderRadius: 10,
    backgroundColor: '#F3E8FF',
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#F3E8FF',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.4,
    shadowRadius: 4,
    elevation: 3,
  },
  buttonBrand: {
    width: 160,
    height: 80,
    marginBottom: '15%', // Add margin to create space between rows
    marginRight: 40,
    borderRadius: 10,
    backgroundColor: '#FFFFFF',
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#F3E8FF',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.4,
    shadowRadius: 4,
    elevation: 3,
  },
  productCard: {
    width: '30%', // 3 columns, so each card takes 33% of the container
    marginBottom: 16,
    height: 250,
    marginHorizontal: 4,
    borderRadius: 10,
    backgroundColor: 'white',
    justifyContent: 'space-between',
    padding: 10,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.4,
    shadowRadius: 4,
    elevation: 3,
  },
  productImage: {
    width: '100%',
    height: '60%',
    resizeMode: 'cover',
    borderRadius: 10,
  },
  favoriteIcon: {
   position: 'absolute',
    top: 5,
    right: 5,
  },
  productName: {
    marginTop: 5,
  },
  productDetails: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  productPrice: {
    fontWeight: 'bold',
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
    borderTopWidth: 1,
    borderColor: '#ddd',
    paddingTop: 10,       // Add padding at the top to create distance from the content above
    paddingBottom: 20,    // Increase paddingBottom for more space at the bottom
    position: 'absolute', // Position the footer absolutely
    bottom: 0,            // Position the footer at the bottom
    width: '100%',       // Make the footer full width
    backgroundColor: 'white', // Set a background color for the footer
  },
  footerIcon: {
    alignItems: 'center',
  },

});


export default Home;
