// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyDCgzQ90-m71RmmBZ17iQz1da0s1XEfRhU',
    appId: '1:37048842296:web:345342deb6994151d48ecd',
    messagingSenderId: '37048842296',
    projectId: 'jaishiv-e5c7a',
    authDomain: 'jaishiv-e5c7a.firebaseapp.com',
    storageBucket: 'jaishiv-e5c7a.appspot.com',
    measurementId: 'G-1C5HCMFVY6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB18Cw544_RwES851EldZRgKDaKewJraxo',
    appId: '1:37048842296:android:775974ccb8a6d8e9d48ecd',
    messagingSenderId: '37048842296',
    projectId: 'jaishiv-e5c7a',
    storageBucket: 'jaishiv-e5c7a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIvAiet5XJJqRV60tBGrzySokb5ceFlnI',
    appId: '1:37048842296:ios:a3121d265a59356fd48ecd',
    messagingSenderId: '37048842296',
    projectId: 'jaishiv-e5c7a',
    storageBucket: 'jaishiv-e5c7a.appspot.com',
    iosBundleId: 'com.example.socialmediaapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIvAiet5XJJqRV60tBGrzySokb5ceFlnI',
    appId: '1:37048842296:ios:a3121d265a59356fd48ecd',
    messagingSenderId: '37048842296',
    projectId: 'jaishiv-e5c7a',
    storageBucket: 'jaishiv-e5c7a.appspot.com',
    iosBundleId: 'com.example.socialmediaapp',
  );
}
