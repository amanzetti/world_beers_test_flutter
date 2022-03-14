import 'fermentation.dart';
import 'mash_temp.dart';

class Method {
  List<MashTemp?>? mashTemp;
  Fermentation? fermentation;
  dynamic twist;

  Method({this.mashTemp, this.fermentation, this.twist});

  Method.fromJson(Map<String, dynamic> json) {
    if (json["mash_temp"] is List) {
      mashTemp = json["mash_temp"] == null
          ? null
          : (json["mash_temp"] as List).map((e) => MashTemp.fromJson(e)).toList();
    }
    if (json["fermentation"] is Map) {
      fermentation =
          json["fermentation"] == null ? null : Fermentation.fromJson(json["fermentation"]);
    }
    twist = json["twist"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mashTemp != null) {
      data["mash_temp"] = mashTemp?.map((e) => e?.toJson()).toList();
    }
    if (fermentation != null) {
      data["fermentation"] = fermentation?.toJson();
    }
    data["twist"] = twist;
    return data;
  }
}
