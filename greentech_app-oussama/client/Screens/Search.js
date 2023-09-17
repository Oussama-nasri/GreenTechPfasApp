import React, { useEffect, useState } from 'react';
import { Image, ScrollView, StyleSheet, Text, TextInput, View } from 'react-native';
import { Card } from 'react-native-paper';


const Filtre = ({ navigation }) => {
  const [data, setData] = useState([]);
  const [selectedType, setSelectedType] = useState(null);
  const [searchQuery, setSearchQuery] = useState('');

  const loadData = () => {
    fetch("http://192.168.1.19:8000/products/", {
      method: 'GET',
    })
      .then((res) => res.json())
      .then((data) => {
        setData(data);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  useEffect(() => {
    loadData();
  }, []);



  const handleSearchQuery = (query) => {
    setSearchQuery(query);
  };

  const renderData = () => {
    let filteredData = data;

    if (selectedType) {
      filteredData = filteredData.filter(item => item.Type === selectedType);
    }

    if (searchQuery) {
      filteredData = filteredData.filter(item => item.names.toLowerCase().includes(searchQuery.toLowerCase()));
    }

    if (filteredData.length === 0) {
      return (
        <View style={styles.emptyContainer}>
          <Text>No data available</Text>
        </View>
      );
    }

    return filteredData.map(item => (
      <Card key={item.id} style={styles.cardStyle} onPress={() => clickedItem(item)}>
        <Image source={{ uri: item.images }} style={styles.imageStyle} />
        <Text>{item.names}</Text>
        <Text>{item.prices}</Text>
        <Text>{item.brand}</Text>
        <Text>{item.Type}</Text>
      </Card>
    ));
  };

  const clickedItem = (data) => {
    navigation.navigate("Details", { data: data });
  };


  return (
    <ScrollView>
      <View style={styles.container}>
        <TextInput
          style={styles.searchInput}
          placeholder="Search by name..."
          value={searchQuery}
          onChangeText={handleSearchQuery}
        />
        {renderData()}
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  cardStyle: {
    padding: 10,
    margin: 10,
    justifyContent: 'center',
    alignItems: 'center',
  },
  fab: {
    marginHorizontal: 8,
  },
  imageStyle: {
    width: 100,
    height: 100,
  },
  filterContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 10,
  },
  searchInput: {
    width: '80%',
    height: 40,
    borderWidth: 1,
    borderRadius: 5,
    paddingHorizontal: 10,
    marginBottom: 10,
  },
});

export default Filtre;


