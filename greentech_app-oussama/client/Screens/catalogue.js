import React, { useEffect, useState } from 'react';
import { Button,TouchableOpacity, FlatList, Image, StyleSheet, Text, TextInput, View } from 'react-native';
import DropDownPicker from 'react-native-dropdown-picker';
import { Ionicons } from '@expo/vector-icons';
import { Card, FAB } from 'react-native-paper';

import Navbar from './navbar';
const Catalogue = ({ navigation, route }) => {
  const { admin, connected, type, brand } = route.params;

  const [isOpen1, setIsOpen1] = useState(false);
  const [isOpen2, setIsOpen2] = useState(false);
  const [isOpenfilter, setIsOpenfilter] = useState(false);
  const [typesData, setTypesData] = useState([]);
  const [brandsData, setBrandsData] = useState([]);


  const [data, setData] = useState([]);
  const [selectedType, setSelectedType] = useState('');
  const [selectedBrand, setSelectedBrand] = useState('');
  const [minPrice, setMinPrice] = useState('');
  const [maxPrice, setMaxPrice] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [isInputActive, setInputActive] = useState(false);

  const loadData = async (productType, productBrand) => {
    try {
      let url = 'http://192.168.1.19:8000/products/';

    if (productType && productType !== "") {
      url = `http://192.168.1.19:8000/products/type/${productType}/`;
    }

    if (productBrand && productBrand !== "") {
      // Append the brand parameter to the URL
      url = `http://192.168.1.19:8000/products/brand/${productBrand}/`;
    }

    const response = await fetch(url);
      const jsonData = await response.json();
      setData(jsonData);
      console.log("admin:"+admin);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    if (type && type !== "") {
      if (brand && brand !== "") {
        loadData(type, brand);
      } else {
        loadData(type);
      }
    } else {
      if (brand && brand !== "") {
        loadData(null, brand);
      } else {
        loadData();
      }
    }

  }, []);

  useEffect(() => {
    const distinctTypes = [...new Set(data.map((item) => item.Type))];
    const distinctBrands = [...new Set(data.map((item) => item.brand))];
    setTypesData(distinctTypes.map((type) => ({ label: type, value: type })));
    setBrandsData(distinctBrands.map((brand) => ({ label: brand, value: brand })));
  }, [data]);

  const handleTypeChange = (value) => {
    setSelectedType(value);
  };

  const handleBrandChange = (value) => {
    setSelectedBrand(value);
  };
  const handleFilterButtonClick = () => {
   setIsOpenfilter(!isOpenfilter);
  };

  const handleMinPriceChange = (value) => {
    setMinPrice(value);
  };

  const handleMaxPriceChange = (value) => {
    setMaxPrice(value);
  };

  const handleSearchQuery = (query) => {
    setSearchQuery(query);
    setInputActive(query.length > 0);
  };

  const parsePrice = (price) => parseFloat(price.replace('$', '').replace(',', '.'));

  const filterData = () => {
    let filteredData = data;

    if (selectedType) {
      filteredData = filteredData.filter((item) => item.Type === selectedType);
    }

    if (selectedBrand) {
      filteredData = filteredData.filter((item) => item.brand === selectedBrand);
    }

    if (minPrice) {
      filteredData = filteredData.filter((item) => parsePrice(item.prices) >= parsePrice(minPrice));
    }

    if (maxPrice) {
      filteredData = filteredData.filter((item) => parsePrice(item.prices) <= parsePrice(maxPrice));
    }

    if (searchQuery) {
      filteredData = filteredData.filter((item) => item.names.toLowerCase().includes(searchQuery.toLowerCase()));
    }

    return filteredData;
  };

  const renderItem = ({ item }) => (
    <Card key={item.id} style={styles.cardStyle} onPress={() => clickedItem(item)}>
      <Image source={{ uri: item.images }} style={styles.imageStyle} />
      <Text style={styles.textstyle}>{item.names}</Text>
      <Text>{item.prices}</Text>
    </Card>
  );

  const clickedItem = (item) => {
    navigation.navigate('Details', { data: item, admin: admin ,connected: connected});
  };

  const renderNoData = () => (
    <View style={styles.emptyContainer}>
      <Text>No data available</Text>
    </View>
  );

  return (
    <View style={styles.container}>
    <Navbar connected={connected} login={false}></Navbar>
          <View style={styles.topcontainer}>
      <TextInput
        style={styles.searchInput}
        placeholder="Search by name..."
        value={searchQuery}
        onChangeText={handleSearchQuery}
      /> 
       
   
      <TouchableOpacity style={styles.filterButton} onPress={handleFilterButtonClick}>
     
   
    
    <Image source={require('../assets/settings-sliders.png')} style={styles.iconImage} />
   <Text>        </Text>
     
      </TouchableOpacity>
    </View>
      {isInputActive ? (
        <FlatList
          data={filterData()}
          renderItem={renderItem}
          keyExtractor={(item) => item.id.toString()}
          numColumns={2}
          contentContainerStyle={styles.gridContainer}
          ListEmptyComponent={renderNoData}
        />
      ) : (
        <View>
    {isOpenfilter  &&
        (
          <View style={styles.dropdownContainer}>
            <DropDownPicker
              items={typesData}
              open={isOpen1}
              setOpen={setIsOpen1}
              value={selectedType}
              setValue={handleTypeChange}
              placeholder="Select a category"
              style={styles.dropdown}
             autoScroll
              
            />

          </View>)}
          {isOpenfilter  && !isOpen1 &&
          
        (     <View style={styles.dropdownContainer}>
            <DropDownPicker
              items={brandsData}
              open={isOpen2}
              setOpen={setIsOpen2}
              value={selectedBrand}
              setValue={handleBrandChange}
              placeholder="Select a brand"
              style={styles.dropdown}
         
              dropDownDirection="TOP"
              modalAnimationType='slide'
   
          
            />
          </View>)}
          {isOpenfilter  &&
        (     <View style={styles.priceFilterContainer}>
            <TextInput
              style={styles.priceInput}
              placeholder="Min Price"
              keyboardType="numeric"
              value={minPrice}
              onChangeText={handleMinPriceChange}
            />
            <TextInput
              style={styles.priceInput}
              placeholder="Max Price"
              keyboardType="numeric"
              value={maxPrice}
              onChangeText={handleMaxPriceChange}
            />
          </View> )}
          <View style={styles.listContainer}>
          <FlatList
            data={filterData()}
            renderItem={renderItem}
            keyExtractor={(item) => item.id.toString()}
            numColumns={2}
            contentContainerStyle={styles.gridContainer}
          />
           {admin &&(
        <FAB
          style={styles.fab}
          icon="plus"
          onPress={() => navigation.navigate('Create', { admin: admin})}
        />
      )}
          </View>
        </View>
     
      )}
   
    </View>
  );
};


const styles = StyleSheet.create({
  gridContainer: {
    padding: 5,
  
  },
  gridItem: {
    flex: 1,
    margin: 8,
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 8,
    minHeight: 100,
  },
  iconContainer: {
    width: 24,
    height: 24,
    justifyContent: 'center',
    alignItems: 'center',
  },
filterButton:{
  marginTop:10,
  flexDirection: 'row',
  justifyContent: 'space-between',
  
},
listContainer:{
marginBottom:220,

},
  topcontainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingHorizontal: 10,
    marginBottom: 10,
    marginTop:10
  },
  container: {
    flex: 1,
    position: 'relative',
    marginBottom:10,
    backgroundColor: '#FFFFFF',
    
  },
  dropdownContainer: {
    maxHeight:6000,
    maxWidth: 390,
   
    marginLeft:10,
    marginBottom:10,
    zIndex: 990,
  

    justifyContent: 'center',
    alignItems: 'center',
    scrollEnabled: true,
  },
  dropdown: {
    zIndex: 999,
  },
  priceFilterContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    marginBottom: 10,
  },
  priceInput: {
    flex: 1,
    height: 40,
    paddingHorizontal: 10,
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    marginRight: 10,
  },
  cardStyle: {
    padding: 10,
    margin: 5,
    height: 200, width: 190,
    justifyContent: 'center',
    alignItems: 'center',
    zIndex: 100,
    backgroundColor: 'white',
  },
  fab: {
    marginHorizontal: 30,
    justifyContent: 'center',
    alignItems: 'center',
    width:350,
    height: 40,
  },
  textstyle:{
    alignSelf: 'center',
    
  },
  imageStyle: {
    width: 100,
    height: 100,
    alignSelf: 'center',
   
  },
  iconImage: {
    width: 24,
    height: 24,
    resizeMode: 'contain',
   
   
  },
  searchInput: {
    borderRadius: 10,
    borderWidth: 3,
    borderColor: '#CDB1EC',
    width: '80%',
    height: 40,
    borderWidth: 1,
    borderRadius: 5,
    paddingHorizontal: 10,
    marginBottom: 10,
  },
});

export default Catalogue;

// <Button style={{ margin: 10 }} title="Search" mode="contained" onPress={() => navigation.navigate('Search')} />
