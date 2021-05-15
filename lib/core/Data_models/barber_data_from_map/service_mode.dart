import 'dart:convert';

import 'package:flutter/widgets.dart';

///ServiceModel class contains the Individual Service object(Service is something provided by the store)
///Contains 2 fields, serviceName - name of the Service provided, price - Price of the service
class ServiceModel {
  ServiceModel({
    @required this.serviceName,
    @required this.price,
  });

  String serviceName;
  int price;

  /// Factory of converting raw JSON string to the ServiceModel elements
  factory ServiceModel.fromRawJson(String str) =>
      ServiceModel.fromJson(json.decode(str));

  /// Method of converting Model into Raw JSON String
  String toRawJson() => json.encode(toJson());

  /// Factory for converting individual JSON object into ServiceModel object
  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        serviceName: json["ServiceName"] == null ? null : json["ServiceName"],
        price: json["Price"] == null ? null : json["Price"],
      );

  /// Converting individual ServiceModel object to a JSON object
  Map<String, dynamic> toJson() => {
        "ServiceName": serviceName == null ? null : serviceName,
        "Price": price == null ? null : price,
      };
}
