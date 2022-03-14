import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/api/beers.dart';
import 'package:world_beers_test_flutter/constants/route_name.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/routes.dart';

class HomePageVM extends ChangeNotifier {
  List<Beer>? _beers = [];

  List<Beer>? get beers => _beers;

  void getBeers({
    List<Beer>? listBeer,
    String? serchFilter,
    required int pageNumber,
    required int pageSize,
  }) async {
    List<Beer>? _list = await ApiBeer().getBeers(serchFilter: serchFilter, pageNumber: pageNumber, pageSize: pageSize);
    if (listBeer != null) {
      _beers = [...listBeer, ..._list ?? []];
    } else {
      _beers = _list;
    }

    notifyListeners();
  }

  void toBeerDetail({required Beer beer}) {
    RouteNavigator.pushNamed(routeName: RouteName.pathBeerDetail, arguments: beer);
  }
}
