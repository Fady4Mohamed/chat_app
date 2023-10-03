import 'package:chat/widget/chat.dart';
import 'package:chat/model/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class chatpage extends StatelessWidget {
  chatpage({required this.email});
  String email;

  TextEditingController controller = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  String? message;
  final ScrollController _scrollcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('attime', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<Messages> messageslist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            if (snapshot.data!.docs[i]['message'] == null) {
              messageslist.add(Messages(message: " "));
            } else {
              messageslist.add(Messages.fromJson(snapshot.data!.docs[i]));
            }
          }
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Image.asset(
                    'assets/pngegg.png',
                    height: 75,
                  ),
                  const Text(
                    'chat',
                    style: TextStyle(
                        fontSize: 24, color: Color.fromARGB(255, 59, 89, 142)),
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 219, 204, 4),
              automaticallyImplyLeading: false,
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 219, 204, 4),
                    Color.fromARGB(255, 81, 169, 246),
                    Color.fromARGB(255, 43, 64, 251)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollcontroller,
                    itemBuilder: (context, counter) {
                      DateTime now = DateTime.parse(
                          snapshot.data!.docs[counter]['attime']);
                      int year = now.year;
                      int month = now.month;
                      int day = now.day;
                      int hour = now.hour;
                      int minute = now.minute;
                      if (snapshot.data!.docs[counter]['E-mail'] == email) {
                        return localchatMe(
                          message: messageslist[counter],
                          data: '$month/$day/$year-$hour:$minute',
                        );
                      } else {
                        return localchatHe(
                          message: messageslist[counter],
                          data: '$month/$day/$year-$hour:$minute',
                        );
                      }
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: TextField(
                    cursorHeight: 20,
                    controller: controller,
                    onChanged: (value) {
                      message = value;
                    },
                    cursorColor: const Color.fromARGB(255, 55, 90, 120),
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 4, 21, 103))),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          messages.add({
                            'message': message,
                            'attime': DateTime.now().toString(),
                            'E-mail': email,
                          });
                          controller.clear();
                          _scrollDown();
                        },
                        child: const Icon(
                          Icons.send_rounded,
                          color: Color.fromARGB(255, 4, 21, 103),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 4, 21, 103))),
                    ),
                  ),
                ),
              ]),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Image.asset(
                    'assets/pngegg.png',
                    height: 75,
                  ),
                  const Text(
                    'chat',
                    style: TextStyle(
                        fontSize: 24, color: Color.fromARGB(255, 59, 89, 142)),
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 219, 204, 4),
              automaticallyImplyLeading: false,
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 219, 204, 4),
                    Color.fromARGB(255, 81, 169, 246),
                    Color.fromARGB(255, 43, 64, 251)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(children: [
                Expanded(
                  child: ListView(children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const ModalProgressHUD(
                          inAsyncCall: true, child: SizedBox()),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: TextField(
                    
                    cursorColor: const Color.fromARGB(255, 55, 90, 120),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 4, 21, 103))),
                      suffixIcon: const Icon(
                        Icons.send_rounded,
                        color: Color.fromARGB(255, 4, 21, 103),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 4, 21, 103))),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
      },
    );
  }

  void _scrollDown() {
    _scrollcontroller.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }
}
