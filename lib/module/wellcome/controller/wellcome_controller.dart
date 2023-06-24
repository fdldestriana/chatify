import 'package:flutter/material.dart';
import '../view/wellcome_view.dart';

class WellcomeController extends State<WellcomeView> {
  static late WellcomeController instance;
  late WellcomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
