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
    apiKey: 'AIzaSyAZ-v11nqTj791a4_s09ROaZuQEBLwOnaQ',
    appId: '1:284582757657:web:606436b749444893f5f188',
    messagingSenderId: '284582757657',
    projectId: 'chat-app-1584f',
    authDomain: 'chat-app-1584f.firebaseapp.com',
    storageBucket: 'chat-app-1584f.appspot.com',
    measurementId: 'G-6E7K9DVWN1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkWfcoi9p7JhH0lJpwrm0zydI4yfwTSfU',
    appId: '1:284582757657:android:800eecd5159b5c4ff5f188',
    messagingSenderId: '284582757657',
    projectId: 'chat-app-1584f',
    storageBucket: 'chat-app-1584f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKRCKPWhN9jYF0zFDKGK00sgqR7SJrRlE',
    appId: '1:284582757657:ios:7b04a75f99b28d8ff5f188',
    messagingSenderId: '284582757657',
    projectId: 'chat-app-1584f',
    storageBucket: 'chat-app-1584f.appspot.com',
    iosClientId: '284582757657-c3hfd43nu6lvsrpkievek08aclcligak.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKRCKPWhN9jYF0zFDKGK00sgqR7SJrRlE',
    appId: '1:284582757657:ios:7b04a75f99b28d8ff5f188',
    messagingSenderId: '284582757657',
    projectId: 'chat-app-1584f',
    storageBucket: 'chat-app-1584f.appspot.com',
    iosClientId: '284582757657-c3hfd43nu6lvsrpkievek08aclcligak.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );
}