import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detail-chat');
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
                        'Coffe Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Good night, This item is on lorem ipsum dolor sit amet',
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
                  'Now',
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
