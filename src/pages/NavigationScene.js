/**
 * Created by BulldogX on 2018/12/15.
 */


import React, {Component} from 'react';


import {createStackNavigator} from 'react-navigation';

import ActivityScene from './ActivityScene';


export default class NavigationScene extends Component {
	render(){
		const Navigator = createStackNavigator(
			{
				Activity: {
					screen: ActivityScene,
				}
			},
			{
				initialRouteName:'Activity',
				initialRouteParams:this.props,
				navigationOptions:{

				}
			});

		return(
			<Navigator/>
		)
	}
}

