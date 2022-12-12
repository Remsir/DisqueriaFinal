import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static Future<User?> iniciarSesion({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    GoogleSignIn objGoogleSingIn = GoogleSignIn();
    GoogleSignInAccount? obgGoogleSignInAccount =
        await objGoogleSingIn.signIn();

    if (obgGoogleSignInAccount != null) {
      GoogleSignInAuthentication obgGoogleSignInAuthentication =
          await obgGoogleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: obgGoogleSignInAuthentication.accessToken,
          idToken: obgGoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticacion");
      }
    }
  }
}
