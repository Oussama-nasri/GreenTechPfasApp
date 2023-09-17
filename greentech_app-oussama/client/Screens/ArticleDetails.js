import { useNavigation } from '@react-navigation/native';
import React, { useEffect, useState } from 'react';
import { Image, Linking, ScrollView, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { Button } from 'react-native-paper';


function ArticleDetails(props) {
    const data = props.route.params.data;
    const admin = props.route.params.admin;
    const connected = props.route.params.connected;
    const navigation = useNavigation();

    const handleEditPress = () => {
        props.navigation.navigate('Edit', { data: data, admin: admin ,connected:connected});
    };

    const handleDeletePress = async () => {
        try {
        const response = await fetch(`http://192.168.1.19:8000/products/${data.id}/`, {
            method: 'DELETE',
            headers: {
            'Content-Type': 'application/json',
            },
        });

        if (response.status === 204) {
            navigation.navigate('Home', { admin: admin ,connected:connected});
        } else {
            console.error('Failed to delete the article.');
        }
        } catch (error) {
        console.error('An error occurred while deleting the article.', error);
        }
    };

    // Use state to store the latest data
    const [productData, setProductData] = useState(data);

    // Fetch the latest data when the component mounts
    useEffect(() => {
        // Fetch data from the server here and update the state
        fetch(`http://192.168.1.19:8000/products/${data.id}`)
        .then(response => response.json())
        .then(data => setProductData(data))
        .catch(error => console.error('Error fetching product data', error));
    }, [data.id]);

    return (
        <ScrollView style={styles.scrollViewStyle}>
        <TouchableOpacity
            onPress={() => {
            navigation.goBack();
            }}
            style={[
            styles.buttonStyle
            ]}
        >
            <Image
            source={require('../assets/backicon2png.png')} 
            style={styles.buttonImageStyle}
            />
        </TouchableOpacity>

        <View style={styles.viewStyle}>
            <Image source={{ uri: productData.images }} style={styles.imageStyle} />
            <View style={styles.contentContainer}>
            <View style={styles.infoRow}>
                <Text style={styles.nameText}>{productData.names}</Text>
                <View style={styles.priceRow}>
                        <Text style={styles.fromText}>from</Text>
                        <Text style={styles.priceText}>{productData.prices}</Text>
                </View>
            </View>
            <Text style={{ fontSize: 20, marginTop: 20 }}>{productData.brand}</Text>
            <Text style={{ fontSize: 20, marginTop: 5 }}>{productData.Type}</Text>

            <Button icon="cart" onPress={() => Linking.openURL(data.Link)}>Buy</Button>
            <Text style={styles.boldText}>Description:</Text>
            <Text style={{ fontSize: 15, marginTop: 20 }}>{productData.descriptions}</Text>
            <Text style={styles.boldText}>Ingredients:</Text>
            <Text style={{ fontSize: 15, marginTop: 20 }}>{productData.ingredients}</Text>
            <View style={styles.btnStyle}>
                {admin && (
                <Button icon="update" mode="contained" onPress={handleEditPress}>
                    Edit
                </Button>
                )}
                {admin && (
                <Button icon="delete" mode="contained" onPress={handleDeletePress}>
                    Delete
                </Button>
                )}
            </View>
            </View>
        </View>
        </ScrollView>
    );
    }

    const styles = StyleSheet.create({
    scrollViewStyle: {
        backgroundColor: 'white',  // Set the background color to white
    },
    viewStyle: {
        flex: 1,
        alignItems: 'center',  // Align the content horizontally at the center
        justifyContent: 'flex-start',  // Align the content vertically at the start
        paddingTop: 20,
        margin: 20,
    },
    contentContainer: {
        width: '100%',  // Make sure the content occupies the full width
    },
    btnStyle: {
        flexDirection: 'row',
        justifyContent: 'space-around',
        margin: 15,
        padding: 10,
    },
    imageStyle: {
        width: 300,
        height:280,
        alignSelf: 'flex-start',  // Center the image horizontally within the view
        marginTop: 0,
        resizeMode: 'cover',
    },
    buttonContentStyle: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
    },
    buttonStyle: {
        padding: 10,
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
    },
    buttonImageStyle: {
        width: 24,
        height: 22,
        marginRight:300,
        marginTop:10,
    },
    infoRow: {
      flexDirection: 'row',
      alignItems: 'center',
      marginBottom: 10,
      marginLeft:42,
      marginRight:30,
      justifyContent: 'center',
    },
    nameText: {
        fontSize: 20,
        marginTop:30,
    },
    priceText: {
        fontSize: 20,
        color: 'black',
        marginLeft: 30,
    },
    fromText: {
      marginLeft: 45,
      marginTop:20,
    },
    boldText: {
      fontSize: 16,
      fontWeight: 'bold',
      marginTop: 20,
  },

});

export default ArticleDetails;