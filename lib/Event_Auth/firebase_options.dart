// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPwZlF2EMjqD24zQ4D4TfHAG1vJ66HzFc',
    appId: '1:205828389331:android:c59efbda307fb1694b5726',
    messagingSenderId: '205828389331',
    projectId: 'signindemo-fe533',
    databaseURL:
        'https://signindemo-fe533-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'signindemo-fe533.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNBRHh4G4UMJMX03QRs1GtIiwv6DWOTyM',
    appId: '1:722539246690:ios:a0bfb0c6da1e47fc8c0d3b',
    messagingSenderId: '205828389331',
    projectId: 'signindemo-fe533',
    databaseURL:
        'https://signindemo-fe533-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'signindemo-fe533.appspot.com',
    androidClientId:
        '1077178975297-240memflj0cjola1dqfn36ftkr3inv9v.apps.googleusercontent.com',
    iosClientId:
        '1077178975297-f3hbd3slfm2rh36l464ac9c82lolgr78.apps.googleusercontent.com',
    iosBundleId: 'au.com.snapride.client',
  );
}