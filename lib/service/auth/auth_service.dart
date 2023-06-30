import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  get isAuthenticated {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> signUsingPhoneNumber(
      String phoneNumb, BuildContext context) async {
    try {
      await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: phoneNumb.replaceFirst(RegExp(r'0'), '+62'),
        verificationFailed: (e) => throw Exception(e.message),
        codeAutoRetrievalTimeout: (verificationId) {},
        verificationCompleted: (PhoneAuthCredential cred) async =>
            await auth.signInWithCredential(cred),
        codeSent: (verificationId, _) async {
          // TextEditingController controller = TextEditingController();
          // PhoneAuthCredential cred = PhoneAuthProvider.credential(
          //     verificationId: verificationId, smsCode: smsCode);
          // await auth.signInWithCredential(cred);
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
