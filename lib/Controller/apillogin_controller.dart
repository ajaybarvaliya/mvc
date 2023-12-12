import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../View/home_screen-get_api.dart';

class ApiController extends GetxController {
  bool Loading = false;
  bool hasherror = false;

  Future login({String? email, String? pass}) async {
    Loading = true;

    final response = await http.post(
      Uri.parse("https://uis.sataware.dev/api/login"),
      body: {
        "email": email,
        "password": pass,
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      // update();
      // Get.snackbar(
      //   'Status',
      //   responseData["status"],
      // );
      Get.showSnackbar(
        GetSnackBar(
            title: "",
            message: responseData["status"],
            duration: const Duration(seconds: 1)),
      );

      print("StatusCode ${response.statusCode}");
      print("StatusCode $responseData");

      responseData["status"] == 'success'
          ? Get.to(() => HomeScreenGetApi())
          : null;

      Loading = false;

      update();

      return responseData;
    } else {
      print("StatusCode ${response.statusCode}");
      Loading = false;
      update();
    }
  }
}
