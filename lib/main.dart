import 'package:chatify/firebase_options.dart';
import 'package:chatify/module/chat/view/chat_view.dart';
import 'package:chatify/module/wellcome/view/wellcome_view.dart';
import 'package:chatify/service/auth/auth_service.dart';
import 'package:chatify/state_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthService().isAuthenticated
          ? const ChatView()
          : const WellcomeView(),
    );
  }
}
