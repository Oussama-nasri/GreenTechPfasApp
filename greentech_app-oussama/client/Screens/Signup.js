import { useNavigation } from '@react-navigation/native';
import React, { useState } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { Button, TextInput } from 'react-native-paper';
import { Image } from "expo-image";
import { ScrollView } from 'react-native-gesture-handler';
function Signup() {
  const [email, setEmail] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [password1, setPassword1] = useState("");
  const [password2, setPassword2] = useState("");
  const navigation = useNavigation();
  const [errorMessage, setErrorMessage] = useState("");

  const handleSignup = () => {
    if (firstName === "") {
        setErrorMessage("First Name is required");
        return;
      }
  
      if (lastName === "") {
        setErrorMessage("Last Name is required");
        return;
      }

    if (email === "") {
      setErrorMessage("Email is required");
      return;
    }

    if (password1 === "") {
      setErrorMessage("Password is required");
      return;
    }

    if (password1 !== password2) {
        setErrorMessage("Passwords do not match");
        return;
      }

    // Send signup information to the backend
    fetch("http://192.168.1.19:8000/login/user/", {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        U_Email: email,
        U_Pwd: password1,
        U_FirstName: firstName,
        U_LastName: lastName,
        U_Admin: false,
        U_Client: true
      })
    })
      .then(response => response.json())
      .then(data => {
        if (data.hasOwnProperty('U_Id')) {
          // Signup successful, perform additional actions here
          // For example, store authentication information in the global application state
          // or navigate to another page
          console.log(data); // Log response data for debugging purposes
          navigation.navigate("Login");
        } else {
          console.log(data); // Log response data
          // Signup failed, set appropriate error message
            setErrorMessage("");
            setErrorMessage(data);
          }
        }).catch(error => console.error(error));
  };

  return (
    <ScrollView>
    <View     style={styles.container}>
    <View      style={styles.imagecontainer}>
<Image
            source={require('../assets/icon.png')} 
            style={styles.imagestyle}
            />
</View>

      <TextInput
        style={styles.inputstyle}
        label="First Name"
        value={firstName}
        mode='outlined'
        onChangeText={text => setFirstName(text)}
      />
      <TextInput
        style={styles.inputstyle}
        label="Last Name"
        value={lastName}
        mode='outlined'
        onChangeText={text => setLastName(text)}
      />
      <TextInput
        style={styles.inputstyle}
        label="Email"
        value={email}
        mode='outlined'
        onChangeText={text => setEmail(text)}
      />
      <TextInput
        style={styles.inputstyle}
        label="Password"
        value={password1}
        mode='outlined'
        secureTextEntry={true}
        onChangeText={text => setPassword1(text)}
      />
      <TextInput
        style={styles.inputstyle}
        label="Confirm Password"
        value={password2}
        mode='outlined'
        secureTextEntry={true}
        onChangeText={text => setPassword2(text)}
      />
      <Button style={{ margin: 10 }} icon="" mode="contained" onPress={handleSignup}>
        Sign up
      </Button>
      <Text style={styles.errorMessage}>{errorMessage}</Text>
      <TouchableOpacity  onPress={() => navigation.navigate("Login",{connected:false})}>
        <Text style={styles.nonLinkStyle}>Already have an account ?</Text><Text style={styles.linkStyle}>Login</Text>
      </TouchableOpacity>
    </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  inputstyle: {
    padding: 10,
    margin: 10,
  },

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
  container: {
    flex: 1,
    padding: '2%',
    backgroundColor: '#ffffff',
   height:900
  },
  errorMessage: {
    color: 'red',
    textAlign: 'center',
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

export default Signup;

