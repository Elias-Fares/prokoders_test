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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiUfYDuha9avGcUcFUdL9ypKJoyShFS6U',
    appId: '1:72663800229:android:3a26973277ccb4e8dd304c',
    messagingSenderId: '72663800229',
    projectId: 'prokoders-test',
    storageBucket: 'prokoders-test.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4o-_8tbA_hRoZ0LyUJSR92haMu7WRcco',
    appId: '1:72663800229:ios:327d4876d68c5736dd304c',
    messagingSenderId: '72663800229',
    projectId: 'prokoders-test',
    storageBucket: 'prokoders-test.firebasestorage.app',
    iosBundleId: 'com.example.prokodersTest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAM0KLlvZd5JXQE8Rn-lgS6ayGxAnEbTeE',
    appId: '1:72663800229:web:4ca9af33433ce6abdd304c',
    messagingSenderId: '72663800229',
    projectId: 'prokoders-test',
    authDomain: 'prokoders-test.firebaseapp.com',
    storageBucket: 'prokoders-test.firebasestorage.app',
    measurementId: 'G-SJMPSWPFLT',
  );
}
