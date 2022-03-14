import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/api/localize_text.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/widgets/atoms/divider_balck.dart';
import 'package:world_beers_test_flutter/widgets/atoms/text_card_beer.dart';

Widget beerInfo({required Beer beer}) {
  String _nameBeer = serviceIntl.appLocale.nameBeer.toUpperCase() + ':';
  String _abv = serviceIntl.appLocale.abv.toUpperCase() + ':';
  String _ibu = serviceIntl.appLocale.ibu.toUpperCase() + ':';
  String _description = serviceIntl.appLocale.description.toUpperCase() + ':';

  return Column(
    children: [
      SizedBox(
          height: 420,
          child: (beer.imageUrl != null)
              ? Image.network(
                  beer.imageUrl!,
                  fit: BoxFit.contain,
                )
              : const SizedBox(
                  height: 420,
                )),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          textCard(_nameBeer),
          const Spacer(),
          Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                          beer.name ?? "N/A",
                          maxLines: 1,
                        ),
              )),
        ],
      ),
      dividerBlack(),
      Row(
        children: [
          textCard(_abv),
          const Spacer(),
          Text((beer.abv != null) ? beer.abv.toString() : "N/A"),
        ],
      ),
      dividerBlack(),
      Row(
        children: [
          textCard(_ibu),
          const Spacer(),
          Text((beer.ibu != null) ? beer.ibu.toString() : "N/A"),
        ],
      ),
      dividerBlack(),
      Row(
        children: [textCard(_description), const Spacer()],
      ),
      Flexible(
        child: ListView(
          children: [
            Text(
              beer.description ?? "N/A",
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    ],
  );
}
