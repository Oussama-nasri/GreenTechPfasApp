import React, { useState, useRef } from "react";
import { StyleSheet, View, Text, Pressable, ScrollView, Dimensions } from "react-native";
import { LinearGradient } from "expo-linear-gradient";
import Onboarding1 from "./Onboarding1";
import Onboarding2 from "./Onboarding2";
import Onboarding3 from "./Onboarding3";
import { Pagination } from 'react-native-snap-carousel';
import { Color } from "../GlobalStyles";

const OnboardingCombined = ({ navigation }) => {
  const scrollViewRef = useRef();
  const windowWidth = Dimensions.get("window").width;
  const [activeSlide, setActiveSlide] = useState(0);

  const handleNext = () => {
    const nextPage = activeSlide + 1;
    if (nextPage < 3) {
      scrollViewRef.current.scrollTo({ x: nextPage * windowWidth, animated: true });
      setActiveSlide(nextPage);
    } else {
        navigation.navigate("Home",{admin:false,connected:false});
    }
  };

  const getButtonText = () => {
    if (activeSlide === 0) {
      return "Next";
    } else if (activeSlide === 1) {
      return "Next";
    } else {
      return "Get Started";
    }
  };

  return (
 
    <View style={styles.container}>
        
      <ScrollView
        ref={scrollViewRef}
        horizontal
        pagingEnabled
        showsHorizontalScrollIndicator={false}
        scrollEnabled={false} 
      >
        <LinearGradient
          style={styles.onboarding}
          locations={[0, 1]}
          colors={["#f3e8ff", "#fbffdf"]}
        >
          <Onboarding1 navigation={navigation} />
        </LinearGradient>

      
        <LinearGradient
          style={styles.onboarding}
          locations={[0, 1]}
          colors={["#f3e8ff", "#fbffdf"]}
        >
          <Onboarding2 navigation={navigation} />
        </LinearGradient>

        {/* Onboarding3 */}
        <LinearGradient
          style={styles.onboarding}
          locations={[0, 1]}
          colors={["#f3e8ff", "#fbffdf"]}
        >
          <Onboarding3 navigation={navigation} />
        </LinearGradient>
      </ScrollView>

      <View style={styles.paginationContainer}>
    <Pagination
          dotsLength={3}
          activeDotIndex={activeSlide}
          dotStyle={styles.paginationDot}
        />
        </View>

      <Pressable style={styles.nextButton} onPress={handleNext}>
        <Text style={styles.nextButtonText}>{getButtonText()}</Text>
      </Pressable>
   
       
    </View>
 
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  onboarding: {
    width: Dimensions.get("window").width,
    height: Dimensions.get("window").height,
  },

  paginationDot: {
    width: 12,
    height: 12,
    borderRadius: 5,
    marginBottom:110,

   
  },
  paginationContainer: {
 
    backgroundColor: 'transparent', // Make the background transparent
  },
  nextButton: {
    width: 328,
    position: "absolute",
    marginLeft: -164,
    top: 672,
    borderRadius: 10,
    backgroundColor: Color.accent2,
    marginTop: -80,
    paddingVertical: 16,
    alignItems: "center",
    justifyContent: "center",
    left: "50%",

  },
  nextButtonText: {
    textTransform: "uppercase",
    fontWeight: "700",
    lineHeight: 24,
 
    color: Color.main,
    textAlign: "left",
  },
});

export default OnboardingCombined;