import 'package:chatify/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    // get current user info
    final String userId = FirebaseAuth.instance.currentUser!.uid;
    final String userName =
        FirebaseAuth.instance.currentUser!.displayName as String;
    final Timestamp timestamp = Timestamp.now();

    // create the message
    Message newMessage = Message(
        senderId: userId,
        senderName: userName,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    // construct chat room of two peoples
    List<String> ids = [userId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // add new message to firestore
    await firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> receiveMessage(String userId, String otherId) {
    // construct chat room of two peoples
    List<String> ids = [userId, otherId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
