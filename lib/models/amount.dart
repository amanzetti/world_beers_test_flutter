class Amount {
  double? value;
  String? unit;

  Amount({this.value, this.unit});

  Amount.fromJson(Map<String, dynamic> json) {
    if (json["value"] is double) {
      value = json["value"];
    }
    if (json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["value"] = value;
    data["unit"] = unit;
    return data;
  }
}
