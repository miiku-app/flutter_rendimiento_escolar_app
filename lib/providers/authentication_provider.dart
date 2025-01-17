import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _user = '';
  String get user => _user;

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user?.email ?? '';
      notifyListeners();
    } catch (e) {
      print('Error en el inicio de sesión: $e');
      throw e;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    _user = '';
    notifyListeners();
  }
}
