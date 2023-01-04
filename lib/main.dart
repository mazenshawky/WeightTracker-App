import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';
import 'config/firebase/firebase_options.dart';
import 'config/routes/app_routes.dart';
import 'core/utils/constants.dart';

import 'app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen(
        (user) => user == null
            ? Constants.initialRoute = Routes.loginRoute
            : Constants.initialRoute = Routes.homeRoute,
      );
  runApp(const WeightsApp());
}
