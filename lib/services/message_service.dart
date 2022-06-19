import 'package:brk_mobile/models/message_model.dart';
import 'package:brk_mobile/models/product_model.dart';
import 'package:brk_mobile/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessagesByUserId({required int userId}) {
    print("Checking 0...");
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots();
    } catch (e) {
      print("Checking error... $e");
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    required UserModel user,
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
