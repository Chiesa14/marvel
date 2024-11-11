import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PlanPage1()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == "weak-password") {
        message = "The password provided is weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exists with that email";
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.white.withOpacity(0.2),
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
          .createUserWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PlanPage1()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == "weak-password") {
        message = "The password provided is weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exists with that email";
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.white.withOpacity(0.2),
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }
}
