class BoilVolume {
  int? value;
  String? unit;

  BoilVolume({this.value, this.unit});

  BoilVolume.fromJson(Map<String, dynamic> json) {
    if (json["value"] is int) {
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
