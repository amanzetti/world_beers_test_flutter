import 'package:world_beers_test_flutter/models/temp.dart';

class MashTemp {
  Temp? temp;
  int? duration;

  MashTemp({required this.temp, required this.duration});

  MashTemp.fromJson(Map<String, dynamic> json) {
    if (json["temp"] is Map) {
      temp = json["temp"] == null ? null : Temp.fromJson(json["temp"]);
    }
    if (json["duration"] is int) {
      duration = json["duration"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (temp != null) {
      data["temp"] = temp?.toJson();
    }
    data["duration"] = duration;
    return data;
  }
}
