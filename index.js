/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import testNative from './testNative';
import {name as appName} from './app.json';

AppRegistry.registerComponent(appName, () => App);
AppRegistry.registerComponent('testNative', () => testNative);
