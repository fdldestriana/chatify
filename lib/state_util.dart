import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

BuildContext get globalContext {
  return Get.currentContext;
}

class Get {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get currentContext {
    return navigatorKey.currentState?.context;
  }

  static to(Widget page) async {
    return await navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static back() {
    if (Navigator.canPop(globalContext) == false) return;
    Navigator.pop(globalContext);
  }

  static offAll(page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.height;
  }

  static ValueNotifier<ThemeData> mainTheme =
      ValueNotifier<ThemeData>(ThemeData());
  static changeTheme(ThemeData theme) {
    mainTheme.value = theme;
  }

  static ThemeData get theme {
    return Theme.of(Get.currentContext);
  }

  static Future<void> launchUrls(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

extension ChangeNotifierExtension on State {
  update() {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(() {});
    }
  }
}

class MvcController {}
