import 'package:world_beers_test_flutter/models/amount.dart';

class Malt {
  String? name;
  Amount? amount;

  Malt({required this.name, required this.amount});

  Malt.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["amount"] is Map) {
      amount = json["amount"] == null ? null : Amount.fromJson(json["amount"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    if (amount != null) {
      data["amount"] = amount?.toJson();
    }
    return data;
  }
}
