import { useNavigation } from '@react-navigation/native';
import React, { useState } from 'react';
import { StyleSheet, View } from 'react-native';
import { ScrollView } from 'react-native-gesture-handler';
import { Button, TextInput } from 'react-native-paper';
import Navbar from './navbar';

function Create({route }) {
  const { admin, connected } = route.params;
  const [images, setimages] = useState("");
  const navigation = useNavigation();
  const [descriptions, setdescriptions] = useState("");
  const [link, setlink] = useState("");
  const [names, setnames] = useState("");
  const [ingredients, setingredients] = useState("");
  const [brand, setbrand] = useState("");
  const [type, settype] = useState("");
  const [prices, setprices] = useState("");
  const InsertData = () => {
    fetch("http://192.168.1.19:8000/products/", {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({images:images,names:names,descriptions:descriptions,ingredients:ingredients,brand:brand,prices:prices,Type:type,Link:link})
    })
      .then(response => response.json())
      .then(data => {
        console.log(data);
        navigation.setOptions({ data: data });
        navigation.navigate("Home",{admin:admin,connected:connected});
      })
      .catch(error => console.error("error"));
  };

  return (
    <ScrollView>
    <View  style={styles.container}>
    <Navbar connected={true}></Navbar>
      <TextInput
        style={styles.inputstyle}
        label="name"
        value={names}
        mode='outlined'
        onChangeText={text => setnames(text)}
      />
      <TextInput
        style={styles.inputstyle}
        label="price"
        value={prices}
        mode='outlined'
        onChangeText={text => setprices(text)}
      />
        <TextInput
        style={styles.inputstyle}
        label="brand"
        value={brand}
        mode='outlined'
        onChangeText={text => setbrand(text)}
      />
        <TextInput
        style={styles.inputstyle}
        label="type"
        value={type}
        mode='outlined'
        onChangeText={text => settype(text)}
      />
       <TextInput
        style={styles.inputstyle}
        label="link_image"
        value={images}
        mode='outlined'
        onChangeText={text => setimages(text)}
      />
       
      <TextInput
        style={styles.inputstyle}
        label="link"
        value={link}
        mode='outlined'
        onChangeText={text => setlink(text)}
      />
      <TextInput
        style={styles.inputstyle}
        label="description"
        value={descriptions}
        mode='outlined'
        numberOfLines={10}
        onChangeText={text => setdescriptions(text)}
      />
       <TextInput
        style={styles.inputstyle}
        label="ingredient"
        value={ingredients}
        mode='outlined'
        numberOfLines={10}
        onChangeText={text => setingredients(text)}
      />

      <Button style={{ margin: 10 }} icon="pencil" mode="contained" onPress={InsertData}>
        Insert Product
      </Button>
    </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: '2%',
    backgroundColor: '#ffffff',
  },
  inputstyle: {
    padding: 10,
    margin: 30,
  }
});

export default Create;
