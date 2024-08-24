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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCecJrSWMtMyeqQxf6-SVEr1WAiawXtl1k',
    appId: '1:24489428835:web:1f34cda98a637b98feb556',
    messagingSenderId: '24489428835',
    projectId: 'e-commerce-adminpannel',
    authDomain: 'e-commerce-adminpannel.firebaseapp.com',
    storageBucket: 'e-commerce-adminpannel.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHEOHbMpcAMiL3-PkmuU02PFsSW9jKd4Y',
    appId: '1:24489428835:android:4096fb0824f63be8feb556',
    messagingSenderId: '24489428835',
    projectId: 'e-commerce-adminpannel',
    storageBucket: 'e-commerce-adminpannel.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCecJrSWMtMyeqQxf6-SVEr1WAiawXtl1k',
    appId: '1:24489428835:web:ebd3aaa8b86e7f82feb556',
    messagingSenderId: '24489428835',
    projectId: 'e-commerce-adminpannel',
    authDomain: 'e-commerce-adminpannel.firebaseapp.com',
    storageBucket: 'e-commerce-adminpannel.appspot.com',
  );
}