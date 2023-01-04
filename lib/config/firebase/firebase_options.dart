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
    apiKey: 'AIzaSyBPlOvWVrxEuRmEFb7_vNOongjx-aysdh0',
    appId: '1:874728226088:web:613488d41960c6cb84a41d',
    messagingSenderId: '874728226088',
    projectId: 'weight-tracker-ff370',
    authDomain: 'weight-tracker-ff370.firebaseapp.com',
    storageBucket: 'weight-tracker-ff370.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtV3b-EcvXOjtIbMS-Cx6qREj-H7j5n9U',
    appId: '1:874728226088:android:c9eb55e1ef83087184a41d',
    messagingSenderId: '874728226088',
    projectId: 'weight-tracker-ff370',
    storageBucket: 'weight-tracker-ff370.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFSohORfR9w0Mbq-_UqeCPcdX8cIaHmAk',
    appId: '1:874728226088:ios:084c02f571996e1d84a41d',
    messagingSenderId: '874728226088',
    projectId: 'weight-tracker-ff370',
    storageBucket: 'weight-tracker-ff370.appspot.com',
    iosClientId: '874728226088-8cblcrj0vt6p47kg5t2qv6dv0io6jlca.apps.googleusercontent.com',
    iosBundleId: 'com.example.weightTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFSohORfR9w0Mbq-_UqeCPcdX8cIaHmAk',
    appId: '1:874728226088:ios:084c02f571996e1d84a41d',
    messagingSenderId: '874728226088',
    projectId: 'weight-tracker-ff370',
    storageBucket: 'weight-tracker-ff370.appspot.com',
    iosClientId: '874728226088-8cblcrj0vt6p47kg5t2qv6dv0io6jlca.apps.googleusercontent.com',
    iosBundleId: 'com.example.weightTracker',
  );
}
