import 'package:chatify/module/home/view/home_view.dart';
import 'package:flutter/material.dart';

class HomeController extends State<HomeView> with TickerProviderStateMixin {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  late final TabController tabController;
}
