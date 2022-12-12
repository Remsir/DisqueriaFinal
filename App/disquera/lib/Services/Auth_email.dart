import 'package:firebase_auth/firebase_auth.dart';

class AuthServi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get usuario {
    return _firebaseAuth.authStateChanges();
  }

  Future<User?> iniciarSesion(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future cerrarSesion() async {
    return await _firebaseAuth.signOut();
  }

  Future<User?> crearCuenta(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case 'weak-password':
          return Future.error('La contraseña debe ser de 6 caracteres minimo');
        case 'email-already-in-use':
          return Future.error('Email en uso');
        default:
          return Future.error('Error desconocido');
      }
    }
  }
}
