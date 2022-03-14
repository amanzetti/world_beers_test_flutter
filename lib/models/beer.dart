import 'package:world_beers_test_flutter/models/boil_volume.dart';
import 'package:world_beers_test_flutter/models/ingredient.dart';
import 'package:world_beers_test_flutter/models/method.dart';
import 'package:world_beers_test_flutter/models/volume.dart';

class Beer {
  int? id;
  String? name;
  String? tagline;
  String? firstBrewed;
  String? description;
  String? imageUrl;
  double? abv;
  double? ibu;
  int? targetFg;
  int? targetOg;
  int? ebc;
  int? srm;
  double? ph;
  int? attenuationLevel;
  Volume? volume;
  BoilVolume? boilVolume;
  Method? method;
  Ingredient? ingredients;
  List<String?>? foodPairing;
  String? brewersTips;
  String? contributedBy;

  Beer(
      {required this.id,
      this.name,
      this.tagline,
      this.firstBrewed,
      this.description,
      this.imageUrl,
      this.abv,
      this.ibu,
      this.targetFg,
      this.targetOg,
      this.ebc,
      this.srm,
      this.ph,
      this.attenuationLevel,
      this.volume,
      this.boilVolume,
      this.method,
      this.ingredients,
      this.foodPairing,
      this.brewersTips,
      this.contributedBy});

  Beer.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["tagline"] is String) {
      tagline = json["tagline"];
    }
    if (json["first_brewed"] is String) {
      firstBrewed = json["first_brewed"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["image_url"] is String) {
      imageUrl = json["image_url"];
    }
    if (json["abv"] is double) {
      abv = json["abv"];
    }
    if (json["ibu"] is double) {
      ibu = json["ibu"];
    }
    if (json["target_fg"] is int) {
      targetFg = json["target_fg"];
    }
    if (json["target_og"] is int) {
      targetOg = json["target_og"];
    }
    if (json["ebc"] is int) {
      ebc = json["ebc"];
    }
    if (json["srm"] is int) {
      srm = json["srm"];
    }
    if (json["ph"] is double) {
      ph = json["ph"];
    }
    if (json["attenuation_level"] is int) {
      attenuationLevel = json["attenuation_level"];
    }
    if (json["volume"] is Map) {
      volume = json["volume"] == null ? null : Volume.fromJson(json["volume"]);
    }
    if (json["boil_volume"] is Map) {
      boilVolume = json["boil_volume"] == null ? null : BoilVolume.fromJson(json["boil_volume"]);
    }
    if (json["method"] is Map) {
      method = json["method"] == null ? null : Method.fromJson(json["method"]);
    }
    if (json["ingredients"] is Map) {
      ingredients = json["ingredients"] == null ? null : Ingredient.fromJson(json["ingredients"]);
    }
    if (json["food_pairing"] is List) {
      foodPairing = json["food_pairing"] == null ? null : List<String>.from(json["food_pairing"]);
    }
    if (json["brewers_tips"] is String) {
      brewersTips = json["brewers_tips"];
    }
    if (json["contributed_by"] is String) {
      contributedBy = json["contributed_by"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["tagline"] = tagline;
    data["first_brewed"] = firstBrewed;
    data["description"] = description;
    data["image_url"] = imageUrl;
    data["abv"] = abv;
    data["ibu"] = ibu;
    data["target_fg"] = targetFg;
    data["target_og"] = targetOg;
    data["ebc"] = ebc;
    data["srm"] = srm;
    data["ph"] = ph;
    data["attenuation_level"] = attenuationLevel;
    if (volume != null) {
      data["volume"] = volume?.toJson();
    }
    if (boilVolume != null) {
      data["boil_volume"] = boilVolume?.toJson();
    }
    if (method != null) {
      data["method"] = method?.toJson();
    }
    if (ingredients != null) {
      data["ingredients"] = ingredients?.toJson();
    }
    if (foodPairing != null) {
      data["food_pairing"] = foodPairing;
    }
    data["brewers_tips"] = brewersTips;
    data["contributed_by"] = contributedBy;
    return data;
  }
}
