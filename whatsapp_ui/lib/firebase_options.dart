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
    apiKey: 'AIzaSyAj8wndWm8vTWfMHjRwUzNIQ9Ob2rc8rNM',
    appId: '1:192158545602:web:017f3cb6c4e123a6b52d5b',
    messagingSenderId: '192158545602',
    projectId: 'chat-app-66b10',
    authDomain: 'chat-app-66b10.firebaseapp.com',
    storageBucket: 'chat-app-66b10.appspot.com',
    measurementId: 'G-0K4JM3K9B0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGf_yBwuADN2Dti_7GsJYGqXWGSi19V24',
    appId: '1:192158545602:android:f6f9089e6e988a4ab52d5b',
    messagingSenderId: '192158545602',
    projectId: 'chat-app-66b10',
    storageBucket: 'chat-app-66b10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKeg4r_jhBtNkF7QicsOKyI1VwvqCKht0',
    appId: '1:192158545602:ios:0f27de3cbaf0c8a1b52d5b',
    messagingSenderId: '192158545602',
    projectId: 'chat-app-66b10',
    storageBucket: 'chat-app-66b10.appspot.com',
    iosClientId: '192158545602-6eo41o5pv0s3kv5j9i7ut4u3kumv72c9.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKeg4r_jhBtNkF7QicsOKyI1VwvqCKht0',
    appId: '1:192158545602:ios:0f27de3cbaf0c8a1b52d5b',
    messagingSenderId: '192158545602',
    projectId: 'chat-app-66b10',
    storageBucket: 'chat-app-66b10.appspot.com',
    iosClientId: '192158545602-6eo41o5pv0s3kv5j9i7ut4u3kumv72c9.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappUi',
  );
}