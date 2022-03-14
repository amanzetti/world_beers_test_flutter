import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/widgets/molecules/beer_details.dart';
import 'package:world_beers_test_flutter/widgets/molecules/tile.dart';

Widget beerTileDetails({required Beer beer, required Size size, required VoidCallback detailBeer}) {
  return tile(beer: beer, size: size, detailBeer: detailBeer, body: beerDetails(beer: beer));
}
