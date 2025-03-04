import 'package:http/http.dart' as http;
import 'package:shop_h_dopave_intern/models/product.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    final response = await client.get(
      Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      ),
    );
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception(
        'Failed to load products -- status code = ${response.statusCode}',
      );
    }
  }
}

//https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline
