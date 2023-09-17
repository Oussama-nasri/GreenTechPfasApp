import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from '@react-navigation/stack';
import Constants from 'expo-constants';
import React from "react";
import { StyleSheet, View } from "react-native";
import ArticleDetails from "./Screens/ArticleDetails";
import ArticleEdit from "./Screens/ArticleEdit";
import Create from "./Screens/Create";
import Home from "./Screens/Home";
import Login from "./Screens/Login";
import Search from "./Screens/Search";
import Signup from "./Screens/Signup";
import Catalogue from "./Screens/catalogue";
import Onboarding1 from "./Screens/Onboarding1";
import Onboarding2 from "./Screens/Onboarding2";
import Onboarding3 from "./Screens/Onboarding3";
import OnboardingCombined from "./Screens/OnboardingScreen";
import Chatbot from "./Screens/Chatbot";
import favorite from "./Screens/favorite";
const Stack = createStackNavigator();

function App() {
  return (
    <View style={styles.container}>
       
      <Stack.Navigator screenOptions={{headerShown:false}}>
      <Stack.Screen
              name="OnboardingScreen"
              component={OnboardingCombined}
              options={{ headerShown: false }}
            />
      <Stack.Screen name="Home" component={Home} initialParams={{ admin:false,connected:false }}  />
      <Stack.Screen name="Catalogue" component={Catalogue }  />
        <Stack.Screen name="Login" component={Login} />
        <Stack.Screen name="Signup" component={Signup} />      
        <Stack.Screen name="Details" component={ArticleDetails} />
        <Stack.Screen name="Create" component={Create} />
        <Stack.Screen name="Edit" component={ArticleEdit} />
        <Stack.Screen name="Search" component={Search} />
        <Stack.Screen
              name="Onboarding1"
              component={Onboarding1}
              options={{ headerShown: false }}
            />
            <Stack.Screen
              name="Onboarding2"
              component={Onboarding2}
              options={{ headerShown: false }}
            />
             <Stack.Screen
              name="Onboarding3"
              component={Onboarding3}
              options={{ headerShown: false }}
            />
          <Stack.Screen name="Chatbot" component={Chatbot} />
          <Stack.Screen name="favorite" component={favorite} />
      </Stack.Navigator>
    </View>
  );
}

export default function MainApp() {
  return (
    <NavigationContainer>

      <App />
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
    marginTop: Constants.statusBarHeight,

  }
});
