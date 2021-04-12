

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// if signIn, return home otherwise, return authentication Page
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
      //assert(user != null);
    } on FirebaseAuthException catch (e) {
      return e.message;
      /*if (e.code == 'user-not-found') {
        snack("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        snack("Wrong password provided for that user.", context);
      }
      throw e;*/
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
      //assert(user != null);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }




}