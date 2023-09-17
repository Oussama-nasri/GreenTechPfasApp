import * as React from "react";
import { StyleSheet, View, Text, Pressable } from "react-native";
import { Image } from "expo-image";
import { LinearGradient } from "expo-linear-gradient";
import { FontFamily, FontSize, Color } from "../GlobalStyles";

const Onboarding1 = ({ navigation })=> {
  return (
    <LinearGradient
      style={styles.onboarding1}
      locations={[0, 1]}
      colors={["#f3e8ff", "#fbffdf"]}
    >
     
      <Image
        style={styles.illustrationhealthCareHea}
        contentFit="cover"
        source={require("../assets/illustrationhealth-care--health-research.png")}
      />
      <Pressable style={styles.skip} onPress={() => navigation.navigate("Home",{admin:false,connected:false})}>
        <Text style={[styles.skip1, styles.skip1Typo]}>Skip</Text>
      </Pressable>
    
   
      <Text
        style={[styles.explorePfasFree, styles.nextTypo]}
      >{`Explore PFAS free cosmetics `}</Text>
      <Text style={[styles.viewTheMostContainer, styles.nextWrapperLayout]}>
        <Text
          style={styles.viewTheMost}
        >{`View the most full list of cosmetics that is harmless for your health. `}</Text>
        <Text style={styles.learnMoreWhat}>Learn more what PFAS is</Text>
      </Text>
    </LinearGradient>
  );
};

const styles = StyleSheet.create({
  iconSpaceBlock: {
    marginLeft: 6,
    height: 12,
  },
  skip1Typo: {
    //fontFamily: FontFamily.nunitoRegular,
    lineHeight: 18,
  
  },
  nextWrapperLayout: {
    width: 328,
    position: "absolute",
  },
  nextTypo: {
    fontFamily: FontFamily.h3,
    fontWeight: "700",
    lineHeight: 24,

    color: Color.main,
    textAlign: "left",
  },
  background: {
    height: "100%",
    top: "0%",
    right: "0%",
    bottom: "0%",
    left: "0%",
    backgroundColor: "#fff",
    position: "absolute",
    width: "100%",
  },

  text: {
    top: "16.67%",
    left: "3.33%",
    fontWeight: "500",
    fontFamily: FontFamily.robotoMedium,
    color: Color.wireframesColorsTextLegibilityHighEmphasis,
    textAlign: "left",

    position: "absolute",
  },

  illustrationhealthCareHea: {
    marginTop: -288,
    marginLeft: -154,
    top: "50%",
    width: 300,
    height: 300,
    left: "50%",
    position: "absolute",
  },
  skip1: {
    color: Color.main,
    textDecoration: "underline",
    textAlign: "left",
  },
  skip: {
    left: 316,
    top: 40,
    position: "absolute",
  },
  onboarding1Child: {
    top: 584,
    left: 156,
    width: 48,
    height: 8,
    position: "absolute",
  },
  next: {
    textTransform: "uppercase",
  },
  nextWrapper: {
    marginLeft: -164,
    top: 672,
    borderRadius: 10,
    backgroundColor: Color.accent2,
    paddingHorizontal: 40,
    paddingVertical: 16,
    alignItems: "center",
    justifyContent: "center",
    left: "50%",
    flexDirection: "row",
  },
  explorePfasFree: {
    top: 456,
    left: 72,
    position: "absolute",
  },
  viewTheMost: {
    color: Color.main,
  },
  learnMoreWhat: {
    color: Color.accent2,
    textDecoration: "underline",
  },
  viewTheMostContainer: {
    top: 496,
    left: 16,
    textAlign: "center",
    //fontFamily: FontFamily.nunitoRegular,
    lineHeight: 18,
  
  },
  onboarding1: {
    flex: 1,
    height: 800,
    overflow: "hidden",
    backgroundColor: "transparent",
    width: "100%",
  },
});

export default Onboarding1;