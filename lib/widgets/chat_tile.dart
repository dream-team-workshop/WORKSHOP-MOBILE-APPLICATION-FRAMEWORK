import 'package:brk_mobile/models/message_model.dart';
import 'package:brk_mobile/models/product_model.dart';
import 'package:brk_mobile/models/user.dart';
import 'package:brk_mobile/pages/detail_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

import '../preferences/userPreferences.dart';
import '../providers/user_provider.dart';

class ChatTile extends StatefulWidget {
  final MessageModel message;
  final User user;
  ChatTile(this.message, this.user);

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {

  int? id;
  String? nama, username, token;
  User userDataToSave = new User();

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
      print(userDataToSave.name);
      print(userDataToSave.username);
      print(userDataToSave.email);
      print(userDataToSave.profilePhotoUrl);
      print(userDataToSave.token);

      UserProvider().setUser(value);
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatPage(
              UninitializedProductModel(),
              widget.user,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo_coffein.png',
                  width: 54,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Penjual Kopi',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.message.message,
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Sekarang',
                  // message.updatedAt.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.5,
              color: Color(0XFF2B2939),
            )
          ],
        ),
      ),
    );
  }
}
