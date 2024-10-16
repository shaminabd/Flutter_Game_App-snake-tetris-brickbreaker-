import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong during sign up: $e");
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong during login: $e");
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong during sign out: $e");
    }
  }
}
