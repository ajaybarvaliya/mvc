import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/FilterApi/product_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var he, we;

class _HomeState extends State<Home> {
  ProductController productController = Get.put(ProductController());

  int? select;
  List filterNameList = [
    "A - Z  by Name",
    "Z - A  by Name",
    "0 - 100  by Price",
    "100 - 0  by Price",
    "0.00 - 5.00  by Rating",
    "5.00 - 0.00  by Rating",
  ];

  @override
  void initState() {
    productController.getProductData('');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    he = MediaQuery.of(context).size.height;
    we = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("API Filters"),
        // title: const Text("Oceanmtech"),
      ),
      endDrawer: drawer(),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return listView(controller);
          }
        },
      ),
    );
  }

  ListView listView(ProductController controller) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.productResponseModels?.data[0].productData.length,
      itemBuilder: (context, index) {
        var product =
            controller.productResponseModels?.data[0].productData[index];

        List data = jsonDecode(product?.images ?? "");

        return Container(
          width: we,
          color: Colors.grey.shade300,
          padding: EdgeInsets.all(we * 0.02),
          margin: EdgeInsets.only(
            left: we * 0.03,
            right: we * 0.03,
            bottom: he * 0.013,
            top: index == 0 ? he * 0.013 : 0,
          ),
          child: Row(
            children: [
              Container(
                height: he * 0.09,
                width: we * 0.19,
                child: Image.network(
                  "${data[0]["url"]}",
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: we * 0.68,
                    child: Expanded(
                      child: Text(
                        product!.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: we * 0.68,
                    child: Text(
                      "Categoryname : ${product.categoryName}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: we * 0.68,
                    child: Text(
                      "Price : ${product.minPrice}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: we * 0.68,
                    child: Text(
                      "Rating : ${product.averageRating}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Drawer drawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: he * 0.2,
            child: Center(
              child: Text(
                "Filter",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
          Column(
            children: List.generate(
              filterNameList.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    select = index;
                  });
                  productController.getProductData(index);
                  Navigator.pop(context);
                },
                child: Container(
                  height: he * 0.06,
                  width: we,
                  color: index == select ? Colors.grey : Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  ${filterNameList[index]}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
