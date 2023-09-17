import { useNavigation } from '@react-navigation/native';
import React, { useState } from 'react';
import { StyleSheet, View } from 'react-native';
import { ScrollView } from 'react-native-gesture-handler';
import { Button, TextInput } from 'react-native-paper';
import Navbar from './navbar';

function ArticleEdit(props) {
  const data = props.route.params.data;
  const admin= props.route.params.admin;
  const connected= props.route.params.connected;
  const [images, setimages] = useState(data.images);
  const navigation = useNavigation();
  const [descriptions, setdescriptions] = useState(data.descriptions);
  const [link, setlink] = useState(data.Link);
  const [names, setnames] = useState(data.names);
  const [ingredients, setingredients] = useState(data.ingredients);
  const [brand, setbrand] = useState(data.brand);
  const [type, settype] = useState(data.Type);
  const [prices, setprices] = useState(data.prices);
  
  const handleEditArticle = () => {
    fetch(`http://192.168.1.19:8000/products/${data.id}/`, {
      method: "PUT",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ images:images,names:names,descriptions:descriptions,ingredients:ingredients,brand:brand,prices:prices,Type:type,Link:link})
    })
      .then(response => response.json())
      .then(data => {
        console.log(data);
        navigation.setOptions({ data: data });
        navigation.navigate("Home",{admin:admin,connected:connected});
      })
      .catch(error => console.error(error));
  };

  return (
    <ScrollView>
   
    <View   style={styles.containerstyle}>
    <Navbar connected={true}></Navbar>
      <TextInput
        style={styles.inputStyle}
        label="name"
        value={names}
        mode='outlined'
        onChangeText={text => setnames(text)}
      />
      <TextInput
        style={styles.inputStyle}
        label="price"
        value={prices}
        mode='outlined'
        onChangeText={text => setprices(text)}
      />
        <TextInput
        style={styles.inputStyle}
        label="brand"
        value={brand}
        mode='outlined'
        onChangeText={text => setbrand(text)}
      />
        <TextInput
        style={styles.inputStyle}
        label="type"
        value={type}
        mode='outlined'
        onChangeText={text => settype(text)}
      />
      <TextInput
        style={styles.inputStyle}
        label="link_image"
        value={images}
        mode='outlined'
        onChangeText={text => setimages(text)}
      />
      <TextInput
        style={styles.inputStyle}
        label="name"
        value={names}
        mode='outlined'
        onChangeText={text => setnames(text)}
      />
      <TextInput
        style={styles.inputStyle}
        label="link"
        value={link}
        mode='outlined'
        onChangeText={text => setlink(text)}
      />
      <TextInput
        style={styles.inputStyle}
        label="description"
        value={descriptions}
        mode='outlined'
        numberOfLines={10}
        onChangeText={text => setdescriptions(text)}
      />
      <TextInput
        style={styles.inputStyle}
        label="ingredient"
        value={ingredients}
        mode='outlined'
        numberOfLines={10}
        onChangeText={text => setingredients(text)}
      />
      <Button
        style={{ margin: 10 }}
        icon="pencil"
        mode="contained"
        onPress={handleEditArticle}
      >
        Edit Product
      </Button>
    </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  inputStyle: {
    padding: 10,
    margin: 30,
  },
  containerstyle: {
    backgroundColor: '#FFFFFF',

  },
});

export default ArticleEdit;