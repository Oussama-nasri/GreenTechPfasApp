import * as React from "react";
import { StyleSheet, View, Text, Pressable,ScrollView } from "react-native";
import { Image } from "expo-image";
import { LinearGradient } from "expo-linear-gradient";
import { Color, FontFamily, FontSize } from "../GlobalStyles";

const Onboarding3 = ({ navigation })=> {
  return (
    
    <LinearGradient
      style={styles.onboarding3}
      locations={[0, 1]}
      colors={["#f3e8ff", "#fbffdf"]}
    >
      
      
       
     
      <Image
        style={styles.illustrationcallServiceIcon}
        contentFit="cover"
        source={require("../assets/illustrationcall-service.png")}
      />
     
    
      
      <Text style={[styles.orderHarmlessCosmetics, styles.getStartedTypo]}>
        Order harmless cosmetics
      </Text>
      <Text style={[styles.goToOnline, styles.goToOnlineLayout]}>
        Go to online stores with available cosmetics and order it to enjoy safe
        products
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
    fontFamily: FontFamily.p1,
    lineHeight: 18,
    fontSize: FontSize.p1_size,
  },
  goToOnlineLayout: {
    width: 328,
    position: "absolute",
  },
  getStartedTypo: {
    fontFamily: FontFamily.h3,
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
    fontFamily: FontFamily.robotoMedium,
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
  illustrationcallServiceIcon: {
    marginTop: -288,
    marginLeft: -150,
    top: "50%",
    width: 300,
    height: 300,
    left: "50%",
    position: "absolute",
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
  onboarding3Child: {
    top: 584,
    left: 156,
    width: 48,
    height: 8,
    position: "absolute",
  },
  getStarted: {
    textTransform: "uppercase",
  },
  getStartedWrapper: {
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
  orderHarmlessCosmetics: {
    marginLeft: -96,
    top: 456,
    left: "50%",
    position: "absolute",
  },
  goToOnline: {
    top: 496,
    left: 16,
    textAlign: "center",
    color: Color.main,
    fontFamily: FontFamily.p1,
    lineHeight: 18,
    fontSize: FontSize.p1_size,
  },
  onboarding3: {
    flex: 1,
    height: 800,
    overflow: "hidden",
    backgroundColor: "transparent",
    width: "100%",
  },
});

export default Onboarding3;