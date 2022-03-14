import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/widgets/molecules/beer_info.dart';
import 'package:world_beers_test_flutter/widgets/molecules/tile.dart';

Widget beerTile({required Beer beer, required Size size, required VoidCallback detailBeer}) {
  return tile(beer: beer, size: size, detailBeer: detailBeer, body: beerInfo(beer: beer));
}
