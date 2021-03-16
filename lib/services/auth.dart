import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp(String email, String password) async {
    final _authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }

  Future<UserCredential> signIn(String email, String password) async {
    final _authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }

  Future<User> getUser() async {
    return await _auth.currentUser;
  }
}
