import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/constants/colors_app.dart';
import 'package:world_beers_test_flutter/constants/design_const.dart';
import 'package:world_beers_test_flutter/models/beer.dart';

Widget tile({required Beer beer, required Size size, required VoidCallback detailBeer, required body}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
    child: GestureDetector(
      onTap: detailBeer,
      child: Container(
        decoration: BoxDecoration(
            color: ColorsApp.primary,
            borderRadius: BorderRadius.circular(
              DesignConst.radiusBox,
            ),
            border: Border.all(color: ColorsApp.primary2)),
        constraints: BoxConstraints(minHeight: size.height, maxHeight: size.height),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: body
        ),
      ),
    ),
  );
}

