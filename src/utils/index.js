/**
 * Created by BulldogX on 2018/12/15.
 */

import { NativeModules } from 'react-native';


//导出Native端的方法
export const { showInfo,popToNative,pushNative } = NativeModules.RNInterractModule;


//导出Native端的常量
export const { RNEmitter } = NativeModules.RNInterractModule;

