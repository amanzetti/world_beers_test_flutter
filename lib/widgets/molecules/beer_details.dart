import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/api/localize_text.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/widgets/atoms/divider_balck.dart';
import 'package:world_beers_test_flutter/widgets/atoms/text_card_beer.dart';

Widget beerDetails({required Beer beer}) {
  String _firstBrewed = serviceIntl.appLocale.firstBrewed.toUpperCase() + ':';
  String _brewersTips = serviceIntl.appLocale.brewersTips.toUpperCase() + ':';
  String _foodPairing = serviceIntl.appLocale.foodPairing.toUpperCase() + ':';
  return Column(
    children: [
      Row(
        children: [textCard(_firstBrewed), const Spacer(), Text(beer.firstBrewed ?? 'N/A')],
      ),
      dividerBlack(),
      Row(
        children: [textCard(_brewersTips), const Spacer()],
      ),
      Text(beer.brewersTips ?? 'N/A'),
      dividerBlack(),
      Row(
        children: [textCard(_foodPairing), const Spacer()],
      ),
      Expanded(
        child: ListView.builder(
            itemCount: beer.foodPairing!.length,
            itemBuilder: (context, index) =>
                (Text(beer.foodPairing!.elementAt(index)!))),
      ),
      dividerBlack(),
    ],
  );
}
