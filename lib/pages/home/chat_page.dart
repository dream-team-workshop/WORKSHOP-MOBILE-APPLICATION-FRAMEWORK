import 'package:brk_mobile/theme.dart';
import 'package:brk_mobile/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Message',
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
            color: accentColor,
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
                  'Opss no message yet',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'You have never done a transaction',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12,),
                      ),
                    ),
                    child: Text(
                      'Explore Store',
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

    Widget content(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: accentColor,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [
              ChatTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
