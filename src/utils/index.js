/**
 * Created by BulldogX on 2018/12/15.
 */

import { NativeModules,NativeEventEmitter } from 'react-native';


//导出Native端的方法
export const { showInfo,popToNative,pushNative,patCake,callNameTointroduction } = NativeModules.RNInterractModule;


//导出Native端的常量
export const { RNEmitter } = NativeModules.RNInterractModule;

//iOS Native端监听
export const NativeEmitterModuleIOS = new NativeEventEmitter(NativeModules.RNNotificationManager);

