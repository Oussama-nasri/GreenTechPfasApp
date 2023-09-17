import { useNavigation } from '@react-navigation/native';
import React, { useState } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { Image } from "expo-image";
import { Button, TextInput } from 'react-native-paper';
import Navbar from './navbar';

function Login( {route}) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigation = useNavigation();
  const [errorMessage, setErrorMessage] = useState("");

  const {connected}=route.params.connected;
  const handleLogin = () => {
    

    if (email === "") {
      setErrorMessage("Email is required");
      return;
    }

    if (password === "") {
      setErrorMessage("Password is required");
      return;
    }

    // Envoyer les informations de connexion au backend
    fetch("http://192.168.1.19:8000/login/login/", {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        U_Email: email,
        U_Pwd: password,
      })
    })
      .then(response => response.json())
      .then(data => {
        if (data.hasOwnProperty('U_Id')) {
          // La connexion est réussie, effectuez des actions supplémentaires ici
          // Par exemple, stockez des informations d'authentification dans le state global de l'application
          // ou redirigez vers une autre page
           // Affichez les données de réponse dans la console à des fins de débogage
          console.log(data.U_Admin);
          user_id=data.U_Id
          console.log("--------- User Id :\n",user_id,"\n----------");
          navigation.navigate("Home", { admin: data.U_Admin ,connected:true,user_id});
          setErrorMessage("");
          setEmail("")
          setPassword("");
        } else {
          console.log(data); // Affichez les données
          // La connexion a échoué, définissez le message d'erreur approprié
            if (data.U_Pwd !== password) {
              setErrorMessage("");
            setErrorMessage(data);
            
          } else {
            setErrorMessage("");
            setErrorMessage(data);
          }
        }
      })
      .catch(error => console.error(error));
  };

  return (
    <View  style={styles.container}>
     <Navbar connected={false} login={true}></Navbar>
<View      style={styles.imagecontainer}>
<Image
            source={require('../assets/icon.png')} 
            style={styles.imagestyle}
            />
</View>

      <TextInput
        style={styles.inputstyle}
        label="Email"
        value={email}
        mode='outlined'
        onChangeText={text => setEmail(text)
          && setErrorMessage("")}
      />

      <TextInput
        style={styles.inputstyle}
        label="Password"
        value={password}
        mode='outlined'
        secureTextEntry={true}
        onChangeText={text => setPassword(text)}
      />

      <Button style={{ margin: 10 }} icon="login" mode="contained" onPress={handleLogin}>
        Login
      </Button>
      <Text style={styles.errorMessage}>{errorMessage}</Text>
      <TouchableOpacity  onPress={() => navigation.navigate("Signup")}>
        <Text style={styles.nonLinkStyle}>Don't have an account ?</Text><Text style={styles.linkStyle}>Sign up</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  inputstyle: {
    padding: 10,
    margin: 30,
  },
  container: {
    flex: 1,
    padding: '2%',
    backgroundColor: '#ffffff',},
  imagecontainer: {

    alignItems: 'center',
     
     marginHorizontal:130,
      width:120,
      height:80,
      marginBottom:100     },
  imagestyle: {
  
   width:'300%',
   height:'300%'
  },
  errorMessage: {
    color: 'red',
    textAlign2: 'center',
    marginTop: 10,
    margin: 30,
  },
  linkStyle:{
    color: 'green',
    textAlign: 'center',
    padding: 10,
    fontSize: 17,
  },
  nonLinkStyle:{
    textAlign: 'center',
  }
});

export default Login;
