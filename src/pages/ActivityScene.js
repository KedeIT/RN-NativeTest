/**
 * Created by BulldogX on 2018/12/15.
 */


import React, {Component} from 'react';
import {
	View,
	TouchableOpacity,
	Image,
	Button
} from 'react-native';

import {showInfo,popToNative,pushNative,RNEmitter} from "../utils";

export default class ActivityScene extends Component {
	static navigationOptions = {
		title:'ReactNative',
		headerLeft:(
			<TouchableOpacity onPress={() => popToNative()}>
				<Image
					source={require('../../resource/nav_back_gray.png')}
					style={{width: 44, height: 44, marginLeft: 15}}
				/>
			</TouchableOpacity>
		)
	};

	render() {
		return (
			<View style={{flex: 1,backgroundColor:'white'}}>
				<Button
					title='Native提示'
					onPress={() => showInfo('我是原生端的提示！')}
				/>
				<Button
					title='RN回到Native'
					onPress={() => popToNative()}
				/>
				<Button
					title='RN Push到Native'
					onPress={() => pushNative(RNEmitter)}
				/>
			</View>
		);
	}
}
