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

export default class ActivityScene extends Component {
	static navigationOptions = {
		title:'ReactNative',
		headerLeft:(
			<TouchableOpacity onPress={() => alert('返回')}>
				<Image
					source={require('../../resource/nav_back_gray.png')}
					style={{width: 44, height: 44, marginLeft: 15}}
				/>
			</TouchableOpacity>
		)
	};

	render() {
		return (
			<View style={{flex: 1,backgroundColor:'green'}}>
				<Text style={{fontSize: 20, color: 'green', textAlign: 'center',marginTop:50}}>{this.props.navigation.getParam('msg')}</Text>
			</View>
		);
	}
}
