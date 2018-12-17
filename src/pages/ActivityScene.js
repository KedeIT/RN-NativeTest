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

import {showInfo,popToNative,pushNative,patCake,callNameTointroduction,RNEmitter} from "../utils";

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
					title='1、调用Native提示'
					onPress={() => showInfo('我是原生端的提示！')}
				/>
				<Button
					title='2、RN回到Native'
					onPress={() => popToNative()}
				/>
				<Button
					title='3、RN Push到Native'
					onPress={() => pushNative(RNEmitter)}
				/>
				<Button
					title='4、回调：使用面粉做蛋糕'
					onPress={() => patCake('1斤面粉',
						(cake) => alert(cake),
						(error) => alert('出错了'+error.message))}
				/>
				<Button
					title='5、Promise：点名自我介绍'
					onPress={
						async () => {
							try {
								let introduction = await callNameTointroduction('小明');
								showInfo(introduction);
							}catch (e) {
								alert(e.message);
							}
						}
					}
				/>
			</View>
		);
	}
}
