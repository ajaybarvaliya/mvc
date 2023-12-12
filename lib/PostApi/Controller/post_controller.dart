import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  bool Loading = false;
  bool hasherror = false;

  Future login(String title) async {
    Loading = true;

    http.Response response = await http.post(
      Uri.parse("https://dummyjson.com/products/add"),
      body: {
        "title": title,
      },
    );

    if (response.statusCode == 200) {
      print("StatusBody ${response.body}");

      Loading = false;
      update();
    } else {
      print("StatusCode ${response.statusCode}");
      update();
    }
  }
}
