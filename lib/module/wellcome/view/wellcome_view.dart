import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import '../controller/wellcome_controller.dart';

class WellcomeView extends StatefulWidget {
  const WellcomeView({Key? key}) : super(key: key);

  Widget build(context, WellcomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wellcome"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<WellcomeView> createState() => WellcomeController();
}
