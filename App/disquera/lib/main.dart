// ignore_for_file: unused_import

import 'package:disquera/Screen/agregar_screen.dart';
import 'package:disquera/Screen/base_page.dart';
import 'package:disquera/Screen/home_screen.dart';
import 'package:disquera/Screen/login_google_screen.dart';
import 'package:disquera/Screen/login_screen.dart';
import 'package:disquera/Services/Auth_email.dart';
import 'package:disquera/Tabs/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamProvider<User?>.value(
            value: AuthServi().usuario,
            initialData: null,
            child: MaterialApp(
                localizationsDelegates: [GlobalMaterialLocalizations.delegate],
                supportedLocales: [const Locale('es')],
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home:
                    //AgregarScreen()
                    //HomeScreen()
                    //HomeTab(),
                    //LoginPage()
                    BasePage()
                //LoginScreen()
                ),
          );
        });
  }
}
