import 'package:world_beers_test_flutter/models/temp.dart';

class Fermentation {
  Temp? temp;

  Fermentation({this.temp});

  Fermentation.fromJson(Map<String, dynamic> json) {
    if (json["temp"] is Map) {
      temp = json["temp"] == null ? null : Temp.fromJson(json["temp"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (temp != null) {
      data["temp"] = temp?.toJson();
    }
    return data;
  }
}
