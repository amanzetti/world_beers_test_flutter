import 'package:world_beers_test_flutter/models/hop.dart';
import 'package:world_beers_test_flutter/models/malt.dart';

class Ingredient {
  List<Malt?>? malt;
  List<Hops?>? hops;
  String? yeast;

  Ingredient({this.malt, this.hops, this.yeast});

  Ingredient.fromJson(Map<String, dynamic> json) {
    if (json["malt"] is List) {
      malt = json["malt"] == null
          ? null
          : (json["malt"] as List).map((e) => Malt.fromJson(e)).toList();
    }
    if (json["hops"] is List) {
      hops = json["hops"] == null
          ? null
          : (json["hops"] as List).map((e) => Hops.fromJson(e)).toList();
    }
    if (json["yeast"] is String) {
      yeast = json["yeast"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (malt != null) {
      data["malt"] = malt?.map((e) => e?.toJson()).toList();
    }
    if (hops != null) {
      data["hops"] = hops?.map((e) => e?.toJson()).toList();
    }
    data["yeast"] = yeast;
    return data;
  }
}
