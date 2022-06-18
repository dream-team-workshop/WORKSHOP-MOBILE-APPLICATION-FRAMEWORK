import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'http://coffeein.sixeyes-tech.com/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Situbondo',
      'items': carts.map((cart) => {
        'id': cart.product!.id,
        'quantity': cart.quantity,
      }).toList(),
      'total_price': totalPrice,
      'shipping_price': 0,
      'status': "PENDING",
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }
}
