// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCb08npO3U9hpe9dQT2HUk0FsueUKLFy30',
    appId: '1:395468957968:web:9a74ef8487443717aadd95',
    messagingSenderId: '395468957968',
    projectId: 'fruit-hub-2438c',
    authDomain: 'fruit-hub-2438c.firebaseapp.com',
    storageBucket: 'fruit-hub-2438c.firebasestorage.app',
    measurementId: 'G-ETJ69S2Q8B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7v8qTwsEVTjbNH0-iFoPEciLQzbzCB1Q',
    appId: '1:395468957968:android:06a07f6eead10727aadd95',
    messagingSenderId: '395468957968',
    projectId: 'fruit-hub-2438c',
    storageBucket: 'fruit-hub-2438c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwEhtlZ7MWsmUt7g6o4JNydSunTsVkRfE',
    appId: '1:395468957968:ios:52004bb69de56d62aadd95',
    messagingSenderId: '395468957968',
    projectId: 'fruit-hub-2438c',
    storageBucket: 'fruit-hub-2438c.firebasestorage.app',
    androidClientId: '395468957968-4f5mih6i8b6dhrsapuc246ga9nfp5oml.apps.googleusercontent.com',
    iosClientId: '395468957968-hcf7csauni5p7i92abp501jtr8rch595.apps.googleusercontent.com',
    iosBundleId: 'com.example.commerceHubDashboard',
  );

}