import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key, required this.widgets});
  final List<Widget> widgets;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.widgets,
    );
  }
}
