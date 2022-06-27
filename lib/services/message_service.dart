import 'package:brk_mobile/models/message_model.dart';
import 'package:brk_mobile/models/product_model.dart';
import 'package:brk_mobile/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Stream<QuerySnapshot> getMessagesByUserId({required int userId}) {
  //   print("Checking 0...");
  //   try {
  //     return firestore
  //         .collection('messages')
  //         .where('userId', isEqualTo: userId)
  //         .snapshots();
  //   } catch (e) {
  //     print("Checking error... $e");
  //     throw Exception(e);
  //   }
  // }

  Stream<List<MessageModel>> getMessagesByUserId({int? userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt.compareTo(b.createdAt),
        );
        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    required User user,
    required bool isFromUser,
    required String message,
    required ProductModel product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'message': message,
        'isFromUser': isFromUser,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan berhasil dikirim'),
      );
    } catch (e) {
      throw Exception('Pesan gagal dikirim');
    }
  }
}
