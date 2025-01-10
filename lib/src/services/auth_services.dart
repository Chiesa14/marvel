import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel/src/navigation/main_screens.dart';
import 'package:marvel/src/screens/auth/login/login_page.dart';
import 'package:marvel/src/screens/plans/plans_page.dart';

class AuthServices {
  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PlanPage1()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == "weak-password") {
        message = "The password provided is weak.";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exists with that email.";
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.grey.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } on FirebaseAuthException catch (e) {
      print('Error is from $e');
      String message = 'Invalid email or password.';

      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.grey.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }

  Future<void> signInWithGoogle({
    required BuildContext context,
  }) async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      await FirebaseAuth.instance.signInWithCredential(cred);

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> singnOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LogIn()),
    );
  }
}
