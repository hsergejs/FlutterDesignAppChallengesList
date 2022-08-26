import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:design_app_challenge_5/models/Product.dart';

Future<List<Product>> fetchProducts() async {
  const String apiUrl = "https://5f210aa9daa42f001666535e.mockapi.io/api/products";
  final response = await http.get(apiUrl);

  if(response.statusCode == 200){
    //if server return OK (response 200) get data
    List<Product> products = (json.decode(response.body) as List).map((data) => Product.fromJson(data)).toList(); //function fromJason in Product class

    return products;

  }
  else {
    //if no response, not 200 response, handle exception
    throw Exception("Failed to load Product data from server!");
  }
}