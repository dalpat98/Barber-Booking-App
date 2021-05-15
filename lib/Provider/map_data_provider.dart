import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/Data_models/map_data_model.dart';

///MapDataProvider is the provider of MapDataModel List that can NotifyChanges to the whole list
class MapDataProvider with ChangeNotifier {

  List<MapDataModel> mapDataList;

  ///Constructor, will load the list by making the necessary request
  MapDataProvider() {
    loadData();
  }

  ///Method that loads the List with the MapDataModel Objects requested from API
  loadData() async {
    final _mapjson =
        await rootBundle.loadString('lib/Temporary_data/map_data.json');
    final _parsed = json.decode(_mapjson).cast<Map<String, dynamic>>();
    mapDataList = _parsed
        .map<MapDataModel>((json) => MapDataModel.fromJson(json))
        .toList();

    notifyListeners();
    return true;
  }

  @override
  String toString() {
    return mapDataList.toString();
  }

  //Method will return a List consisting of a Map with 2 fields
  //name- name of marker on map, location - cooordinates of the marker
  get coordinates {
    List<dynamic> _coordinates;
    for (var i = 0; i < mapDataList.length; i++) {
      _coordinates.add(
          {"name": mapDataList[i].name, "location": mapDataList[i].location});
    }
    return [..._coordinates];
  }

  //Method will return the complete List of MapDataModel objects
  get completeData {
    return [...mapDataList];
  }

  //Method will return single MapDataModel object from the complete List
  //where the name field of the MapDataModel object matches with the name provided
  MapDataModel singleComplete(String name) {
    return mapDataList.singleWhere((element) => element.name == name);
  }
}
