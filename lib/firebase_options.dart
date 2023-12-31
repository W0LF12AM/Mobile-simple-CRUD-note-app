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
    apiKey: 'AIzaSyBZiBRg4CxEFaDExSc3L9NRvVszXjDDhcM',
    appId: '1:464004984564:web:d6dbaa044040f13c7778a1',
    messagingSenderId: '464004984564',
    projectId: 'fir-crud-56a6e',
    authDomain: 'fir-crud-56a6e.firebaseapp.com',
    storageBucket: 'fir-crud-56a6e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGRVhvRpsO3Q_xGyVoYoyVjQ90wQmT_iQ',
    appId: '1:464004984564:android:060e17c03350a5607778a1',
    messagingSenderId: '464004984564',
    projectId: 'fir-crud-56a6e',
    storageBucket: 'fir-crud-56a6e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjGfcLSWFmrjx6ubx0ZBhbhQjef7A8AB4',
    appId: '1:464004984564:ios:99c464c3ade6e6cd7778a1',
    messagingSenderId: '464004984564',
    projectId: 'fir-crud-56a6e',
    storageBucket: 'fir-crud-56a6e.appspot.com',
    iosBundleId: 'com.example.crudbasic',
  );
}
