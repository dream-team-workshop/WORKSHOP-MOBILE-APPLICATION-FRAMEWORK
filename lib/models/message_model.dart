import 'package:brk_mobile/models/product_model.dart';

class MessageModel{

  late String message;
  late int userId;
  late String userName;
  late String userImage;
  late bool isFromUser;
  late ProductModel? product;
  late DateTime createdAt;
  late DateTime updatedAt;

  MessageModel(
    this.message,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.product,
    this.createdAt,
    this.updatedAt,
  );
  
  MessageModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    isFromUser = json['isFromUser'];
    

  }
  Map<String, dynamic> toJson(){
    return{
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializedProductModel ? {} : product!.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}