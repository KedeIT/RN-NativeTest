/**
 * Created by BulldogX on 2018/12/15.
 */


import React, {Component} from 'react';
import {
	View,
	TouchableOpacity,
	Image,
	Button,
	Platform,
	Text,
	DeviceEventEmitter
} from 'react-native';

import {
	showInfo,
	popToNative,
	pushNative,
	patCake,
	callNameTointroduction,
	NativeEmitterModuleIOS,
	RNEmitter
} from "../utils";

export default class ActivityScene extends Component {
	static navigationOptions = {
		title: 'ReactNative',
		headerLeft: (
			<TouchableOpacity onPress={() => popToNative()}>
				<Image
					source={require('../../resource/nav_back_gray.png')}
					style={{width: 44, height: 44, marginLeft: 15}}
				/>
			</TouchableOpacity>
		)
	};

	constructor(props) {
		super(props);
		this.subscription = null;
		this.state = {
			loginInfo: '当前未登录',
		};
	}

	updateLoginInfoText = (reminder) => {
		this.setState({loginInfo: reminder.message})
	};

	//添加监听
	componentWillMount() {
		if (Platform.OS === 'ios') {
			console.log('ActivityScene--------->', '开始订阅通知');
			this.subscription = NativeEmitterModuleIOS.addListener('kRNNotification_Login', this.updateLoginInfoText);
		}else if(Platform.OS === 'android'){
			this.subscription = DeviceEventEmitter.addListener('kRNNotification_Login',this.updateLoginInfoText)
		}
	}
	//移除监听
	componentWillUnmount() {
			console.log('ActivityScene--------->', '移除通知');
			this.subscription.remove();
	}


	render() {
		return (
			<View style={{flex: 1, backgroundColor: 'white'}}>
				<Button
					title='1、调用Native提示'
					onPress={() => showInfo('我是原生端的提示！')}
				/>
				<Button
					title='2、RN回到Native'
					onPress={() => popToNative()}
				/>
				<Button
					title='3、RN Push到Native 发送通知页面'
					onPress={() => pushNative(RNEmitter)}
				/>
				<Button
					title='4、回调：使用面粉做蛋糕'
					onPress={() => patCake('1斤面粉',
						(cake) => alert(cake),
						(error) => alert('出错了' + error.message))}
				/>
				<Button
					title='5、Promise：点名自我介绍'
					onPress={
						async () => {
							try {
								let introduction = await callNameTointroduction('小明');
								showInfo(introduction);
							} catch (e) {
								alert(e.message);
							}
						}
					}
				/>

				<Text style={{fontSize: 20, color: 'red', textAlign: 'center',marginTop:50}}>{this.state.loginInfo}</Text>
				{/*展示Native端传递过来的参数*/}
				<Text style={{fontSize: 20, color: 'green', textAlign: 'center',marginTop:50}}>{this.props.navigation.getParam('msg')}</Text>
			</View>
		);
	}
}
