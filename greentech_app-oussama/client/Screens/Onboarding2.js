import * as React from "react";
import { StyleSheet, View, Text, Pressable } from "react-native";
import { Image } from "expo-image";
import { LinearGradient } from "expo-linear-gradient";
import { Color, FontFamily, FontSize } from "../GlobalStyles";
import { ScrollView } from "react-native";

const Onboarding2 = ({ navigation }) => {
  return (
  
    <LinearGradient
      style={styles.onboarding2}
      locations={[0, 1]}
      colors={["#f3e8ff", "#fbffdf"]}
    >
     
      <Image
        style={styles.illustrationbusinessPlanIcon}
        contentFit="cover"
        source={require("../assets/illustrationbusiness-plan.png")}
      />
      <Pressable style={styles.skip} onPress={() => navigation.navigate("Home",{admin:false,connected:false})}>
      <Text style={[styles.skip1, styles.skip1Typo ]}>Skip</Text>

      </Pressable>
     
      <Pressable
        style={[styles.nextWrapper, styles.nextWrapperLayout]}
          onPress={() => navigation.navigate("Onboarding3")}
      >
        <Text style={[styles.next, styles.nextTypo]}>Next</Text>
      </Pressable>
      <Text style={[styles.viewPricesAnd, styles.nextTypo]}>
        View prices and where to buy
      </Text>
      <Text style={[styles.getInfoAbout, styles.nextWrapperLayout]}>
        Get info about product availability, price and where to buy it
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
    color: Color.main,
   
    lineHeight: 18,
    fontSize: FontSize.p1_size,
  },
  nextWrapperLayout: {
    width: 328,
    position: "absolute",
  },
  nextTypo: {
  
    fontWeight: "700",
    lineHeight: 24,
    fontSize: FontSize.h3_size,
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
  cellularIcon: {
    width: 18,
    height: 12,
  },
  wifiIcon: {
    width: 16,
  },
  batteryIcon: {
    width: 24,
  },
  icons: {
    height: "50%",
    width: "19.44%",
    top: "25%",
    right: "3.33%",
    bottom: "25%",
    left: "77.22%",
    flexDirection: "row",
    position: "absolute",
  },
  text: {
    top: "16.67%",
    left: "3.33%",
    fontWeight: "500",

    color: Color.wireframesColorsTextLegibilityHighEmphasis,
    textAlign: "left",
    fontSize: FontSize.p1_size,
    position: "absolute",
  },
  androidStatusBar: {
    top: 0,
    right: 0,
    left: 0,
    height: 24,
    position: "absolute",
  },
  illustrationbusinessPlanIcon: {
    marginTop: -288,
    marginLeft: -150,
    top: "50%",
    width: 300,
    height: 300,
    left: "50%",
    position: "absolute",
    overflow: "hidden",
  },
  skip1: {
    textDecoration: "underline",
    textAlign: "left",
  },
  skip: {
    left: 316,
    top: 40,
    position: "absolute",
  },
  onboarding2Child: {
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
  viewPricesAnd: {
    marginLeft: -111,
    top: 456,
    left: "50%",
    position: "absolute",
  },
  getInfoAbout: {
    top: 496,
    left: 16,
    textAlign: "center",
    color: Color.main,
   
    lineHeight: 18,
    fontSize: FontSize.p1_size,
  },
  onboarding2: {
    flex: 1,
    height: 800,
    backgroundColor: "transparent",
    overflow: "hidden",
    width: "100%",
  },
});

export default Onboarding2;