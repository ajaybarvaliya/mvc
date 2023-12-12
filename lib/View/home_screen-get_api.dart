import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../Model/get_model.dart';

class HomeScreenGetApi extends StatefulWidget {
  const HomeScreenGetApi({super.key});

  @override
  State<HomeScreenGetApi> createState() => _HomeScreenGetApiState();
}

class _HomeScreenGetApiState extends State<HomeScreenGetApi> {
  GetController getController = Get.put(GetController());

  @override
  void initState() {
    getController.getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.closeAllSnackbars();
    return Scaffold(
      body: GetBuilder<GetController>(
        builder: (controller) => getController.loading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: getController.productData!.products.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            "${getController.productData!.products[index].thumbnail}",
                            fit: BoxFit.cover),
                      ),
                      Text("${getController.productData!.products[index].id}"),
                      Text(
                          "${getController.productData!.products[index].title}"),
                      Divider(),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
