import 'package:brk_mobile/models/message_model.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/services/message_service.dart';
import 'package:brk_mobile/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:brk_mobile/widgets/chat_bubble.dart';
import 'package:brk_mobile/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailChatPage extends StatefulWidget {
  final ProductModel product;

  const DetailChatPage({Key? key, required this.product}) : super(key: key);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo_coffein_online.png',
                width: 50,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildChatInput(authProvider),
      body: buildContent(authProvider),
    );
  }

  buildContent(AuthProvider authProvider) {
    return StreamBuilder<QuerySnapshot>(
        stream: MessageService()
            .getMessagesByUserId(userId: authProvider.user.id ?? 0),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          print('Firebase');
          print(snapshot.data!.docs[0].data());
          var messages = snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> messages =
                document.data()! as Map<String, dynamic>;
            return MessageModel.fromJson(messages);
          }).toList();
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            itemBuilder: (ctx, index) {
              return ChatBubble(product: UninitializedProductModel(), text: messages[index].message, isSender: messages[index].isFromUser,);
            },
            itemCount: messages.length,
          );
        });
  }

  Widget buildChatInput(AuthProvider authProvider) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.product is UninitializedProductModel
              ? SizedBox()
              : buildProductPreview(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: messageController,
                      style: primaryTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  handleAddMessage(authProvider);
                },
                child: Image.asset(
                  'assets/images/img_send.png',
                  width: 45,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProductPreview() {
    var name;
    return Container(
      width: 225.0,
      height: 74.0,
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor3,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            child: Image.network(
              widget.product.galleries?[0].url ?? "",
              width: 54.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product.name ?? "",
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\Rp${widget.product.price}',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/logo_coffein.png',
            width: 22,
          ),
        ],
      ),
    );
  }

  handleAddMessage(AuthProvider authProvider) async {
    await MessageService().addMessage(
      user: authProvider.user,
      isFromUser: true,
      product: widget.product,
      message: messageController.text,
    );

    setState(() {
      messageController.text = '';
    });
  }
}
