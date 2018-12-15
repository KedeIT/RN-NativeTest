/**
 * Created by BulldogX on 2018/12/15.
 */


import React, {Component} from 'react';


import {createStackNavigator} from 'react-navigation';

import ActivityScene from './ActivityScene';

export default router = createStackNavigator(
	{
		Activity: {
			screen: ActivityScene,
		}
	},
	{
		navigationOptions:{

		}
	})
