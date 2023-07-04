import 'package:chatify/module/home/widget/component/re_user_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
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
        return ListView(
          children: snapshot.data!.docs.map<Widget>((doc) {
            var data = doc.data()! as Map<String, dynamic>;
            if (data["uid"] != FirebaseAuth.instance.currentUser!.uid) {
              return ReUserWidget(data: data);
            }
            return Container();
          }).toList(),
        );
      },
    );
  }
}
