/**
 * Created by BulldogX on 2018/12/15.
 */


import React, {Component} from 'react';
import { AppRegistry,View } from 'react-native';


import NavigationScene from './src/pages/NavigationScene';

class RootScene extends Component {
	render(){
		return (
			<View style={{flex:1,background:'white'}}>
				<NavigationScene msg = {this.props.msg}/>
			</View>
		)
	}
}

AppRegistry.registerComponent('RNTest',() => RootScene);
