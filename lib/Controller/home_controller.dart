import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/get_model.dart';

class GetController extends GetxController {
  GetProducts? productData;

  bool loading = false;

  Future getData() async {
    loading = true;
    http.Response response =
        await http.get(Uri.parse("https://dummyjson.com/products"));

    if (response.statusCode == 200) {
      productData = getProductsFromJson(response.body);
      print("RESPONSE ${response.body}");
      update();
      loading = false;
    } else {
      print("RESPONSE ${response.statusCode}");
      update();
      loading = false;
    }
  }
}
