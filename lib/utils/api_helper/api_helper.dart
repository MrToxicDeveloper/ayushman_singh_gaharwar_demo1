import 'dart:convert';

import 'package:ayushman_singh_gaharwar_demo1/home/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper{
  static ApiHelper helper = ApiHelper._();
  ApiHelper._();

  Future<ProductModel> apiCaller() async {
    Uri uri = Uri.parse("https://praticle-service.s3.ap-south-1.amazonaws.com/red_and_white_api.json");
    var res = await http.get(uri);
    var json = jsonDecode(res.body);
    ProductModel model = ProductModel.fromJson(json);
    return model;
  }
}