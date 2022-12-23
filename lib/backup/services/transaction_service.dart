import 'package:craftshop_indonesia/models/cart_model.dart';
import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TransactionService {
  String baseUrl = 'http://6659-112-215-170-126.ap.ngrok.io/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = 'baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'marsemoon',
      'items': carts
          .map((cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              })
          .toList(),
      'status': "Pending",
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(
      url,
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
