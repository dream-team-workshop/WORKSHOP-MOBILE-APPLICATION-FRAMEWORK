import 'package:brk_mobile/models/message_model.dart';
import 'package:brk_mobile/models/user.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/providers/page_provider.dart';
import 'package:brk_mobile/providers/user_provider.dart';
import 'package:brk_mobile/services/message_service.dart';
import 'package:brk_mobile/theme.dart';
import 'package:brk_mobile/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../preferences/userPreferences.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int? id;
  String? nama, username, token;

  User? userDataToSave;

  void getUserData() {
    UserPreferences().getUser().then((value) {
      print("value: $value");
      id = value.id!;
      nama = value.name!;
      username = value.username!;
      token = value.token!;
      print(id);
      print(nama);
      print(username);
      userDataToSave = value;
      print(userDataToSave!.name);
      print(userDataToSave!.username);
      print(userDataToSave!.email);
      print(userDataToSave!.profilePhotoUrl);
      print(userDataToSave!.token);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvier pageProvier = Provider.of<PageProvier>(context);

    // User userProvider = Provider.of<UserProvider>(context).setUser(userDataToSave);

    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Pesan',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
            color: whiteColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_chat.png',
                  width: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Ups! belum ada pesan',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Anda belum melakukan transaksi apapun',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      pageProvier.currentIndex = 0;
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      'Telusuri Kopi',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                )
              ],
            )),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService().getMessagesByUserId(userId: id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return emptyChat();
              }

              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: whiteColor,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    children: [
                      ChatTile(snapshot.data![snapshot.data!.length - 1], userDataToSave!),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
