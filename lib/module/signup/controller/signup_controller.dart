import 'package:chatify/shared/enum/authstate.dart';
import 'package:flutter/material.dart';
import '../view/signup_view.dart';

class SignupController extends State<SignupView> {
  static late SignupController instance;
  late SignupView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController textController = TextEditingController();

  AuthState _authState = AuthState.notLoggedIn;
  AuthState get authState => _authState;
  void setAuthState(AuthState setAuthState) {
    _authState = setAuthState;
    setState(() {});
  }

  Future<void> signUpUsingPhoneNumber() async {
    setAuthState(AuthState.loading);
    try {
      setAuthState(AuthState.loggedIn);
    } catch (e) {
      setAuthState(AuthState.notLoggedIn);
      throw e.toString();
    }
  }
}
