import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../core/Data_models/barber_data_from_map/barber_data_from_map_model.dart';
import '../../core/Data_models/barber_data_from_map/comment_model.dart';
import '../../core/Data_models/barber_data_from_map/service_mode.dart';

///BarberDataFromMapProvider is the provider of BarberDataFromMapModel List that can NotifyChanges to the whole list
///this list has elements based on MapDataProvider List, only the Elements that were marked on the Map will be Fetched from here
class BarberDataFromMapProvider with ChangeNotifier {
  List<BarberDataFromMapModel> _barberdatalist;
  ///Constructor, It will load the necessary Data into the BarberDataFromMapList
  BarberDataFromMapProvider() {
    loadData();
  }
  //FutureMethod, it is responsible for loading data from the json file into the Model object and then into the list
  void loadData() async {
    final _mapjson = await rootBundle
        .loadString('lib/Temporary_data/barber_data_from_map.json');
    final parsed = json.decode(_mapjson).cast<Map<String, dynamic>>();
    _barberdatalist = parsed
        .map<BarberDataFromMapModel>(
            (json) => BarberDataFromMapModel.fromJson(json))
        .toList();
  }

  @override
  String toString() {
    return _barberdatalist.toString();
  }
  ///get Method, to get the complete BarberDataList
  get barberDataList {
    return [..._barberdatalist];
  }
  /// Method, it will return the List of Services that the particular Store offers,
  /// it yields a single ServiceModel object based on the storeName provided to it as a parameter
  List<ServiceModel> barberDataServices({@required String storeName}) {
    return [
      ..._barberdatalist
          .singleWhere((element) => element.mapData.name == storeName)
          .services
    ];
  }
  /// Method, it will return the List of Comments that the consumers wrote for a particular store,
  /// it yields a single CommentModel object based on the storeName provided to it as a parameter
  List<CommentModel> barberDataComments({@required String storeName}) {
    return [
      ..._barberdatalist
          .singleWhere((element) => element.mapData.name == storeName)
          .comments
    ];
  }
  /// Method, it will return the List of Photos that the particular Store uploaded to it's gallery,
  /// it yields a single Gallery object based on the storeName provided to it as a parameter
  List<dynamic> barberDataGallery({@required String storeName}) {
    return [
      ..._barberdatalist
          .singleWhere((element) => element.mapData.name == storeName)
          .gallery
    ];
  }
}
