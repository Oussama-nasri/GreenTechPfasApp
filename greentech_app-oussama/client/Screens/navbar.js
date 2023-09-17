import { useNavigation } from '@react-navigation/native';
import React, { useState } from 'react';
import { StyleSheet, Text, Image, TouchableOpacity, View } from 'react-native';
import { Button, TextInput } from 'react-native-paper';
import FontAwesome from 'react-native-vector-icons/FontAwesome';
function Navbar({ connected,login }) {



 const navigation=useNavigation()

 return (
    <View style={{ flexDirection: 'row', justifyContent:  'space-between', alignItems: 'center' }}>
  <TouchableOpacity
        onPress={() => {
         navigation.goBack();
        }}
        style={[
          styles.buttonStyle
        ]}
      >
        <Image
          source={require('../assets/backicon2png.png')} // Replace with the actual path to your image
          style={styles.buttonImageStyle}
        />
      </TouchableOpacity>

   {(!connected && !login )? (<TouchableOpacity onPress={() => navigation.navigate("Login",{connected: connected})}>
      <Text>
      <Image source={require('../assets/sign-in-alt.png')} style={styles.iconImage} /> Login       </Text>
     
    </TouchableOpacity>): (!login)?(<TouchableOpacity onPress={() => navigation.navigate("Home",{ admin: false,connected:false })}>
      <Text>
      <Image source={require('../assets/sign-in-alt.png')} style={styles.iconImage} /> Logout       </Text>
     
    </TouchableOpacity>):(<TouchableOpacity onPress={() => navigation.navigate("Home",{ admin: false,connected:false })}>
      <Text>
       Home      </Text>
     
    </TouchableOpacity>)}
  </View>
  );
}

const styles = StyleSheet.create({

  Container:{
    textAlign: 'right',
   
    margin:10
  },
  loginbutton:{
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  iconImage: {
    width: 10,
    height:10,
    resizeMode: 'contain',
   
   
  },
  buttonImageStyle: {

    width: 24,

    height: 22,

    marginRight:300,

    marginTop:10,

},

buttonStyle: {
    padding: 10,
    borderRadius: 5,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default Navbar;
