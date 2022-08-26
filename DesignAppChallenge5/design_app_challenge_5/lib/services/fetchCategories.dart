import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:design_app_challenge_5/models/Categories.dart';

Future<List<Category>> fetchCategroies() async {
  const String apiUrl = "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";
  final response = await http.get(apiUrl);

  if(response.statusCode == 200){
    //if server return OK (response 200) get data
    List<Category> categories = (json.decode(response.body) as List).map((data) => Category.fromJson(data)).toList(); //function fromJason in Categroy class, and to return list .toList()

    return categories; //return list of categories

  }
  else {
    //if no response, not 200 response, handle exception
    throw Exception("Failed to load Category data from server!");
  }
}