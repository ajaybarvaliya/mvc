import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mvc/selected.dart';

import 'FilterApi/home.dart';
import 'PostApi/View/postapi_screen.dart';
import 'StaggerGridView/stagger_grid_view.dart';
import 'View/api_login.dart';
import 'View/home_screen-get_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
