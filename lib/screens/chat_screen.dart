// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:chat_app/constans.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/custom_chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});
  static String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(snapshot.data!.docs[i]),
            );
          }
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 235, 231, 231),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kImage,
                    height: 50,
                  ),
                  const Text(kTitle),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? CustomChatBuble(
                              message: messagesList[index],
                            )
                          : CustomChatBubleFreind(
                              message: messagesList[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add(
                        {
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          // kCreatedAt: Timestamp.now(),
                          'id': email,
                          // 'time': DateTime.now().toString(),
                        },
                      );
                      controller.clear();

                      _controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: IconButton(
                        onPressed: () {
                          // setState(() {
                          //   print(controller.text);
                          // });
                          if (controller.text.trim().isNotEmpty) {
                            messages.add({
                              kMessage: controller.text,
                              kCreatedAt: DateTime.now(),
                              'id': email,
                            });
                            controller.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          // return const Text('Loading...');
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
