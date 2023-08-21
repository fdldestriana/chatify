import 'package:chatify/module/home/view/user_list/blank_chat_list_view.dart';
import 'package:chatify/module/home/view/user_list/user_list.dart';
import 'package:chatify/module/home/widget/component/re_user_widget.dart';
import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:chatify/state_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Color(0xFF31C48D)));
        }
        if (!snapshot.hasData) {
          return BlankUserList(
            title: "You haven't chat yet",
            reButtonWidget: ReButtonWidget(
              title: "Start Chatting",
              width: Get.width * 0.45,
              height: Get.height * 0.05,
              onPressed: () {},
            ),
          );
        }
        // var widgets = snapshot.data!.docs.map<Widget>((doc) {
        //   var data = doc.data()! as Map<String, dynamic>;

        //   if (data["uid"] != FirebaseAuth.instance.currentUser!.uid) {
        //     ReUserWidget(data: data);
        //   }
        // }).toList();
        List<ReUserWidget>? widgets;
        var docs = snapshot.data!.docs;
        for (Map<String, dynamic> doc in docs) {
          if (doc["uid"] != FirebaseAuth.instance.currentUser!.uid) {
            widgets!.add(ReUserWidget(data: doc));
          }
        }

        if (widgets!.isNotEmpty) {
          return UserList(widgets: widgets);
        } else {
          return BlankUserList(
            title: "You haven't chat yet",
            reButtonWidget: ReButtonWidget(
              title: "Start Chatting",
              width: Get.width * 0.45,
              height: Get.height * 0.05,
              onPressed: () {},
            ),
          );
        }
      },
    );
  }
}
