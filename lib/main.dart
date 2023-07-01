import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_app/firebase_logIn_signUp/screens/signin_screen.dart';
import 'package:investment_app/firebase_logIn_signUp/screens/signup_screen.dart';

import 'data/model/add_date.dart';
import 'firebase_logIn_signUp/screens/reset_password.dart';
import 'widgets/bottomnavigationbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'signin_screen',
      routes: {
        'bottomnavigationbar': (context) => Bottom(),
        'signin_screen': (context) => SignInScreen(),
        'signup_screen': (context) => SignUpScreen(),
        'reset_password': (context) => ResetPassword()
      },
    );
  }
}
