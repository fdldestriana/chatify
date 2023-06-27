import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  get isAuthenticated {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  void signUsingPhoneNumber(String input) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: input.replaceFirst(RegExp(r'0'), '+62'),
          verificationCompleted: (PhoneAuthCredential cred) async {
            await auth.signInWithCredential(cred);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: (verificationId, forceResendingToken) async {
            String smsCode = "";
            PhoneAuthCredential cred = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode);
            await auth.signInWithCredential(cred);
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
