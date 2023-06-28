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

  Future<void> signUsingPhoneNumber(
      {String input = "", String smsCode = ""}) async {
    try {
      await auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: input.replaceFirst(RegExp(r'0'), '+62'),
          verificationCompleted: (PhoneAuthCredential cred) async =>
              await auth.signInWithCredential(cred),
          verificationFailed: (e) => throw Exception(e.message),
          codeSent: (verificationId, forceResendingToken) async {
            PhoneAuthCredential cred = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode);
            await auth.signInWithCredential(cred);
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
