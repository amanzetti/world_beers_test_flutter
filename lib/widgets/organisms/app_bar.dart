import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/constants/colors_app.dart';
import 'package:world_beers_test_flutter/widgets/atoms/text_card_beer.dart';
import 'package:world_beers_test_flutter/widgets/molecules/serch_field.dart';

PreferredSizeWidget appBar({TextEditingController? controllerSearch, String? nameBeer}) {
  return AppBar(
      backgroundColor: ColorsApp.scaffold,
      shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.dark,
          ),
          borderRadius: BorderRadius.zero),
      elevation: 0,
      title: (controllerSearch != null)
          ? searchField(controllerSearch: controllerSearch)
          : textCard(nameBeer ?? 'N/A', colorFont: ColorsApp.dark));
}
