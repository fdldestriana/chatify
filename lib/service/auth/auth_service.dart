import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static get isAuthenticated {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
