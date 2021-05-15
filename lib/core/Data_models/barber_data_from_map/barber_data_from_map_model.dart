import 'dart:convert';

import 'package:meta/meta.dart';

import '../map_data_model.dart';
import 'comment_model.dart';
import 'service_mode.dart';

///BarberDataFromMapModel class that contains Detailed information about the stores included in MapDataModel
///Containers 4 fields MapData - MapDataModel object, services - List of Service object Instances, gallery - List of photos,
///comments - List of Comment object Instances
class BarberDataFromMapModel {
  BarberDataFromMapModel({
    @required this.mapData,
    @required this.services,
    @required this.gallery,
    @required this.comments,
  });

  MapDataModel mapData;
  List<ServiceModel> services;
  List<dynamic> gallery;
  List<CommentModel> comments;

  /// Factory of converting raw JSON string to the BarberDataFromMapModel elements
  factory BarberDataFromMapModel.fromRawJson(String str) =>
      BarberDataFromMapModel.fromJson(json.decode(str));

  /// Method of converting Model into Raw JSON String
  String toRawJson() => json.encode(toJson());

  /// Factory for converting individual JSON object into BarberDataFromMapModel object
  factory BarberDataFromMapModel.fromJson(Map<String, dynamic> json) =>
      BarberDataFromMapModel(
        mapData: json["MapData"] == null
            ? null
            : MapDataModel.fromJson(json["MapData"]),
        services: json["Services"] == null
            ? null
            : List<ServiceModel>.from(
                json["Services"].map((x) => ServiceModel.fromJson(x))),
        gallery: json["Gallery"] == null
            ? null
            : List<dynamic>.from(json["Gallery"].map((x) => x)),
        comments: json["Comments"] == null
            ? null
            : List<CommentModel>.from(
                json["Comments"].map((x) => CommentModel.fromJson(x))),
      );

  /// Converting individual BarberDataFromMapModel object to a JSON object
  Map<String, dynamic> toJson() => {
        "MapData": mapData == null ? null : mapData.toJson(),
        "Services": services == null
            ? null
            : List<dynamic>.from(services.map((x) => x.toJson())),
        "Gallery":
            gallery == null ? null : List<dynamic>.from(gallery.map((x) => x)),
        "Comments": comments == null
            ? null
            : List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}
