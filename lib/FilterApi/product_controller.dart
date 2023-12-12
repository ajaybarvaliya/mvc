import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mvc/FilterApi/product_response.dart';

class ProductController extends GetxController {
  ProductResponseModels? productResponseModels;
  bool loading = false;
  Future getProductData(index) async {
    loading = true;
    update();
    http.Response response = await http.get(Uri.parse(
        "https://praticle-service.s3.ap-south-1.amazonaws.com/api.json"));
    if (response.statusCode == 200) {
      productResponseModels = productResponseModelsFromJson(response.body);
      update();
      print("response  ${response.body}");
      loading = false;
      if (index == 0) {
        productResponseModels!.data[0].productData.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
      } else if (index == 1) {
        productResponseModels!.data[0].productData.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
      } else if (index == 2) {
        productResponseModels!.data[0].productData.sort((a, b) {
          return double.parse(a.minPrice).compareTo(double.parse(b.minPrice));
        });
      } else if (index == 3) {
        productResponseModels!.data[0].productData.sort((a, b) {
          return double.parse(b.minPrice).compareTo(double.parse(a.minPrice));
        });
      } else if (index == 4) {
        productResponseModels!.data[0].productData.sort((a, b) {
          return double.parse(a.averageRating)
              .compareTo(double.parse(b.averageRating));
        });
      } else if (index == 5) {
        productResponseModels!.data[0].productData.sort((a, b) {
          return double.parse(b.averageRating)
              .compareTo(double.parse(a.averageRating));
        });
      } else {
        productResponseModels;
      }

      update();
    } else {
      print("response  ${response.statusCode}");
      loading = false;
      update();
    }
    return productResponseModels;
  }
}
