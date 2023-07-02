import 'package:chatify/module/chat/widget/component/re_tabbarbody_widget.dart';
import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  Widget build(context, ChatController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offAll(const SigninView());
              },
              icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: controller.tabController,
                indicatorColor: const Color(0xFF07DC8A),
                labelColor: const Color(0xFF07DC8A),
                indicator: const BoxDecoration(
                  color: Colors.transparent,
                ),
                tabs: [
                  SizedBox(
                    width: Get.width * 0.27,
                    height: Get.height * 0.04,
                    child: const Tab(text: 'Chats'),
                  ),
                  SizedBox(
                    width: Get.width * 0.27,
                    height: Get.height * 0.04,
                    child: const Tab(text: 'Groups'),
                  ),
                  SizedBox(
                    width: Get.width * 0.27,
                    height: Get.height * 0.04,
                    child: const Tab(text: 'Status'),
                  ),
                  SizedBox(
                    width: Get.width * 0.27,
                    height: Get.height * 0.04,
                    child: const Tab(text: 'Calls'),
                  ),
                ],
                unselectedLabelColor: Colors.black,
              ),
            ],
          ),
        ),
        elevation: 0.0,
        title: Text(
          "Chatify",
          style: GoogleFonts.poppins(
              color: const Color(0xFF000000),
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: SizedBox(
            height: Get.height * 0.67,
            child: TabBarView(
              controller: controller.tabController,
              children: [
                ReTabBarBodyWidget(
                    title: "You haven't chat yet",
                    reButtonWidget: ReButtonWidget(
                      title: "Start Chatting",
                      width: Get.width * 0.45,
                      height: Get.height * 0.05,
                      onPressed: () {},
                    )),
                ReTabBarBodyWidget(
                    title: "You haven't group yet",
                    reButtonWidget: ReButtonWidget(
                      title: "Create Group",
                      width: Get.width * 0.45,
                      height: Get.height * 0.05,
                      onPressed: () {},
                    )),
                const ReTabBarBodyWidget(title: "You haven't status yet"),
                ReTabBarBodyWidget(
                    title: "You haven't call yet",
                    reButtonWidget: ReButtonWidget(
                      title: "Start Call",
                      width: Get.width * 0.45,
                      height: Get.height * 0.05,
                      onPressed: () {},
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onPressed: () {},
        child: Image.asset("assets/buttons/chat_button.png"),
      ),
    );
  }

  @override
  State<ChatView> createState() => ChatController();
}
