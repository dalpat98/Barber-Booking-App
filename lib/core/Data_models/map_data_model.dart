import 'dart:convert';

import 'package:meta/meta.dart';

///Data Model for providing Initial data for Map viewing
///fields are Location - for co-ordinates, name - name of the mark or shop,
///rating - for rating provided, photo - image of the shop or profile,
///workinghors- the open timing of the store
class MapDataModel {
    MapDataModel({
        @required this.location,
        @required this.name,
        @required this.rating,
        @required this.photo,
        @required this.workingHours,
    });

    // Fields of the MapDataModel Class 
    String location;
    String name;
    double rating;
    dynamic photo;
    WorkingHours workingHours;

    /// Factory of converting raw JSON string to the MapDataModel elements
    factory MapDataModel.fromRawJson(String str) => MapDataModel.fromJson(json.decode(str));

    /// Method of converting Model into Raw JSON String
    String toRawJson() => json.encode(toJson());

    /// Factory for converting individual JSON object into MapDataModel object
    factory MapDataModel.fromJson(Map<String, dynamic> json) => MapDataModel(
        location: json["Location"] == null ? null : json["Location"],
        name: json["Name"] == null ? null : json["Name"],
        rating: json["Rating"] == null ? null : json["Rating"].toDouble(),
        photo: json["Photo"],
        workingHours: json["WorkingHours"] == null ? null : WorkingHours.fromJson(json["WorkingHours"]),
    );

    /// Converting individual MapDataModel object to a JSON object
    Map<String, dynamic> toJson() => {
        "Location": location == null ? null : location,
        "Name": name == null ? null : name,
        "Rating": rating == null ? null : rating,
        "Photo": photo,
        "WorkingHours": workingHours == null ? null : workingHours.toJson(),
    };

    @override
    String toString() {
    return "${this.name}, ${this.location},${this.rating}";
     }
}

///WorkingHours Class represents open hours of each day in a week individually
class WorkingHours {
    WorkingHours({
        @required this.monday,
        @required this.tuesday,
        @required this.wednesday,
        @required this.thursday,
        @required this.friday,
        @required this.saturday,
        @required this.sunday,
    });

    //Fields of WorkingHours class containing weekdays
    String monday;
    String tuesday;
    String wednesday;
    String thursday;
    String friday;
    String saturday;
    String sunday;

    ///Factory to convert Raw JSON object into WorkingHours object
    factory WorkingHours.fromRawJson(String str) => WorkingHours.fromJson(json.decode(str));

    /// Converting WorkingHours object in Raw JSON String
    String toRawJson() => json.encode(toJson());

    /// Factory for converting individual JSON object into WorkingHours object
    factory WorkingHours.fromJson(Map<String, dynamic> json) => WorkingHours(
        monday: json["Monday"] == null ? null : json["Monday"],
        tuesday: json["Tuesday"] == null ? null : json["Tuesday"],
        wednesday: json["Wednesday"] == null ? null : json["Wednesday"],
        thursday: json["Thursday"] == null ? null : json["Thursday"],
        friday: json["Friday"] == null ? null : json["Friday"],
        saturday: json["Saturday"] == null ? null : json["Saturday"],
        sunday: json["Sunday"] == null ? null : json["Sunday"],
    );

    /// Converting individual WorkingHours object to a JSON object
    Map<String, dynamic> toJson() => {
        "Monday": monday == null ? null : monday,
        "Tuesday": tuesday == null ? null : tuesday,
        "Wednesday": wednesday == null ? null : wednesday,
        "Thursday": thursday == null ? null : thursday,
        "Friday": friday == null ? null : friday,
        "Saturday": saturday == null ? null : saturday,
        "Sunday": sunday == null ? null : sunday,
    };
}
