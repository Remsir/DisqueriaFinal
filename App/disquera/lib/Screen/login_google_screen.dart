import 'package:disquera/provider/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (() async {
            User? user = await Auth.iniciarSesion(context: context);
            print(user?.displayName);
          }),
          color: Colors.black54,
          child: Icon(MdiIcons.google),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
