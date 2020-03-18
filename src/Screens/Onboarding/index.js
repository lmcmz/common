import {
    SafeAreaView,
    StatusBar,
    StyleSheet,
    Text,
    Button,
    TouchableOpacity,
    View,
    Dimensions
} from 'react-native';
import React from 'react';
import Colors from 'react-native/Libraries/NewAppScreen/components/Colors';
const { height, width } = Dimensions.get('window');

import Swiper from 'react-native-swiper'

export default class onboardingPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
        };
        this.child = React.createRef();
    }
    render() {
        return (
            <>
                <StatusBar barStyle="dark-content" />
                <SafeAreaView style={styles.safeArea}>
                    <View style={styles.body}>
                        <View style={styles.sectionContainer}>
                            <Text style={styles.sectionTitle}>Common!</Text>
                        </View>

                        <Swiper style={styles.wrapper} showsButtons={false} activeDotColor="#3cc7e1" paginationStyle={{ bottom: 0 }} >
                            <View style={styles.slide1}>
                                <View style={styles.image}></View>
                                <Text style={styles.text}>Easily manage large scale collaborative missions in one place</Text>
                            </View>
                            <View style={styles.slide1}>
                                <View style={styles.image}></View>
                                <Text style={styles.text}>Decentralisation is awesome</Text>
                            </View>
                            <View style={styles.slide1}>
                                <View style={styles.image}></View>
                                <Text style={styles.text}>Blockchain promises true decentralisation and we made it super easy</Text>
                            </View>
                        </Swiper>

                        <View style={styles.buttonConatiner}>
                            <TouchableOpacity style={styles.button}>
                                <Text style={styles.buttonText}>Explore Commons!</Text>
                            </TouchableOpacity>
                        </View>

                    </View>
                </SafeAreaView>
            </>
        );
    }
}

const styles = StyleSheet.create({
    safeArea: {
        flex: 1,
        backgroundColor: Colors.white,
    },
    body: {
        backgroundColor: Colors.white,
        flex: 1,
        flexDirection: 'column'
    },
    sectionContainer: {
        marginTop: 22,
        marginBottom: 34,
    },
    buttonConatiner: {
        marginTop: 22,
        marginBottom: 22,
    },
    button: {
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 25,
        marginHorizontal: 24,
        backgroundColor: '#3cc7e1',
    },
    buttonText: {
        color: '#fff',
        fontSize: 16,
        fontWeight: 'bold',
        paddingVertical: 15,
    },
    sectionTitle: {
        fontSize: 20,
        //   fontFamily: 'Roboto',
        fontWeight: '600',
        color: Colors.black,
        textAlign: 'center',
    },
    image: {
        top: 0,
        width: '100%',
        height: '80%',
        backgroundColor: '#efefef'
    },
    wrapper: {},
    slide1: {
        flex: 1,
    },
    text: {
        paddingHorizontal: 33,
        paddingVertical: 20,
        textAlign: 'center',
        color: '#001a36',
        fontSize: 16,
        fontWeight: 'bold'
    }
});