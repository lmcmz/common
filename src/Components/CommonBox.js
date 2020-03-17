import {Text, TouchableOpacity, View} from 'react-native';
import React from 'react';
const CommonsBox = () => {
  return (
    <TouchableOpacity key={i} onPress={{}} style={styles.commonBox}>
      <View
        style={{
          width: '100%',
          padding: 30,
          paddingTop: 50,
          paddingBottom: 50,
          borderTopLeftRadius: 15,
          borderTopRightRadius: 15,
          backgroundColor,
        }}>
        <Text style={{color, fontSize: 20, fontWeight: '700'}}>{dao.name}</Text>
      </View>
      <View
        style={{
          flexDirection: 'row',
          alignItems: 'center',
          justifyContent: 'space-around',
        }}>
        <View
          style={{
            alignItems: 'center',
            justifyContent: 'space-around',
            margin: 17,
          }}>
          <Text
            style={{
              color: 'grey',
              fontSize: 10,
              marginBottom: 15,
              fontWeight: '700',
            }}>
            Reputation Holders
          </Text>
          <Text style={{fontSize: 25, fontWeight: '700'}}>
            {dao.reputationHoldersCount}
          </Text>
        </View>
        <View
          style={{
            height: 50,
            width: 1,
            backgroundColor: '#c9c9c9',
          }}
        />
        <View
          style={{
            alignItems: 'center',
            justifyContent: 'space-around',
            margin: 17,
          }}>
          <Text
            style={{
              color: 'grey',
              fontSize: 10,
              marginBottom: 15,
              fontWeight: '700',
            }}>
            Open Proposals
          </Text>
          <Text style={{fontSize: 25, fontWeight: '700'}}>
            {
              dao.proposals.filter(
                proposal =>
                  proposal.stage !== 'Executed' &&
                  proposal.stage !== 'ExpiredInQueue',
              ).length
            }
          </Text>
        </View>
      </View>
    </TouchableOpacity>
  );
};
