import 'package:world_beers_test_flutter/models/amount.dart';

class Hops {
  String? name;
  Amount? amount;
  String? add;
  String? attribute;

  Hops({this.name, this.amount, this.add, this.attribute});

  Hops.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["amount"] is Map) {
      amount = json["amount"] == null ? null : Amount.fromJson(json["amount"]);
    }
    if (json["add"] is String) {
      add = json["add"];
    }
    if (json["attribute"] is String) {
      attribute = json["attribute"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    if (amount != null) {
      data["amount"] = amount?.toJson();
    }
    data["add"] = add;
    data["attribute"] = attribute;
    return data;
  }
}
