// To parse this JSON data, do
//
//     final productResponseModels = productResponseModelsFromJson(jsonString);

import 'dart:convert';

ProductResponseModels productResponseModelsFromJson(String str) =>
    ProductResponseModels.fromJson(json.decode(str));

String productResponseModelsToJson(ProductResponseModels data) =>
    json.encode(data.toJson());

class ProductResponseModels {
  String status;
  String success;
  String message;
  List<Datum> data;

  ProductResponseModels({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProductResponseModels.fromJson(Map<String, dynamic> json) =>
      ProductResponseModels(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  List<ProductDatum> productData;
  int pagination;
  int sold;
  int unSold;

  Datum({
    required this.productData,
    required this.pagination,
    required this.sold,
    required this.unSold,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productData: List<ProductDatum>.from(
            json["ProductData"].map((x) => ProductDatum.fromJson(x))),
        pagination: json["pagination"],
        sold: json["Sold"],
        unSold: json["UnSold"],
      );

  Map<String, dynamic> toJson() => {
        "ProductData": List<dynamic>.from(productData.map((x) => x.toJson())),
        "pagination": pagination,
        "Sold": sold,
        "UnSold": unSold,
      };
}

class ProductDatum {
  String id;
  String userId;
  String userName;
  String userProfile;
  String address;
  String contactNo;
  String websiteUrl;
  String longitude;
  String langitude;
  String categoryName;
  String subCategoryName;
  String name;
  String currency;
  String minPrice;
  String maxPrice;
  String discountPrice;
  String weight;
  String deliveryCharge;
  String description;
  String condition;
  String images;
  String negotiation;
  SoldStatus soldStatus;
  String productType;
  UserSince userSince;
  String creatAt;
  String productSave;
  String productReport;
  String averageRating;
  String totalUser;

  ProductDatum({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userProfile,
    required this.address,
    required this.contactNo,
    required this.websiteUrl,
    required this.longitude,
    required this.langitude,
    required this.categoryName,
    required this.subCategoryName,
    required this.name,
    required this.currency,
    required this.minPrice,
    required this.maxPrice,
    required this.discountPrice,
    required this.weight,
    required this.deliveryCharge,
    required this.description,
    required this.condition,
    required this.images,
    required this.negotiation,
    required this.soldStatus,
    required this.productType,
    required this.userSince,
    required this.creatAt,
    required this.productSave,
    required this.productReport,
    required this.averageRating,
    required this.totalUser,
  });

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
        id: json["Id"],
        userId: json["UserId"],
        userName: json["UserName"],
        userProfile: json["UserProfile"],
        address: json["Address"],
        contactNo: json["ContactNo"],
        websiteUrl: json["WebsiteUrl"],
        longitude: json["Longitude"],
        langitude: json["Langitude"],
        categoryName: json["CategoryName"],
        subCategoryName: json["SubCategoryName"],
        name: json["Name"],
        currency: json["Currency"],
        minPrice: json["MinPrice"],
        maxPrice: json["MaxPrice"],
        discountPrice: json["DiscountPrice"],
        weight: json["Weight"],
        deliveryCharge: json["DeliveryCharge"],
        description: json["Description"],
        condition: json["Condition"],
        images: json["Images"],
        negotiation: json["Negotiation"],
        soldStatus: soldStatusValues.map[json["SoldStatus"]]!,
        productType: json["ProductType"],
        userSince: userSinceValues.map[json["UserSince"]]!,
        creatAt: json["CreatAt"],
        productSave: json["ProductSave"],
        productReport: json["ProductReport"],
        averageRating: json["AverageRating"],
        totalUser: json["TotalUser"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "UserName": userName,
        "UserProfile": userProfile,
        "Address": address,
        "ContactNo": contactNo,
        "WebsiteUrl": websiteUrl,
        "Longitude": longitude,
        "Langitude": langitude,
        "CategoryName": categoryName,
        "SubCategoryName": subCategoryName,
        "Name": name,
        "Currency": currency,
        "MinPrice": minPrice,
        "MaxPrice": maxPrice,
        "DiscountPrice": discountPrice,
        "Weight": weight,
        "DeliveryCharge": deliveryCharge,
        "Description": description,
        "Condition": condition,
        "Images": images,
        "Negotiation": negotiation,
        "SoldStatus": soldStatusValues.reverse[soldStatus],
        "ProductType": productType,
        "UserSince": userSinceValues.reverse[userSince],
        "CreatAt": creatAt,
        "ProductSave": productSave,
        "ProductReport": productReport,
        "AverageRating": averageRating,
        "TotalUser": totalUser,
      };
}

enum SoldStatus { UNSOLD }

final soldStatusValues = EnumValues({"Unsold": SoldStatus.UNSOLD});

enum UserSince {
  AUGUST_2022,
  JANUARY_2022,
  MAY_2022,
  MAY_2023,
  NOVEMBER_2022,
  OCTOBER_2022,
  SEPTEMBER_2022
}

final userSinceValues = EnumValues({
  "August 2022": UserSince.AUGUST_2022,
  "January 2022": UserSince.JANUARY_2022,
  "May 2022": UserSince.MAY_2022,
  "May 2023": UserSince.MAY_2023,
  "November 2022": UserSince.NOVEMBER_2022,
  "October 2022": UserSince.OCTOBER_2022,
  "September 2022": UserSince.SEPTEMBER_2022
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
