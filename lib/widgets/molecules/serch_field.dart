import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/constants/colors_app.dart';
import 'package:world_beers_test_flutter/constants/design_const.dart';

Widget searchField({required TextEditingController controllerSearch}) {
  return SizedBox(
    height: DesignConst.heightAppBar - 15,
    child: TextFormField(
        controller: controllerSearch,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_sharp, color: ColorsApp.dark),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsApp.primary)),
            border: OutlineInputBorder(borderSide: BorderSide(color: ColorsApp.dark)))),
  );
}
