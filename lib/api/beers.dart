import 'dart:convert';

import 'package:world_beers_test_flutter/api/check_connection.dart';
import 'package:world_beers_test_flutter/constants/api.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:http/http.dart' as http;

class ApiBeer {
  Future<List<Beer>?> getBeers(
      {String? serchFilter, required int pageNumber, required int pageSize}) async {
    if (await CheckConnection.instance.checkConnection()) {
      Map<String, dynamic>? _queryParameters = {
        ApiConst.pageNumber: pageNumber.toString(),
        ApiConst.pageSize: pageSize.toString(),
      };

      if (serchFilter != null && serchFilter != '') {
        final q = <String, dynamic>{ApiConst.beerName: serchFilter};
        _queryParameters.addEntries(q.entries);
      }
      Uri _uri = Uri.https(
          ApiConst.endpointRoot, ApiConst.pathVersion + ApiConst.pathBeer, _queryParameters);

      var resp = await http.get(_uri);

      if (resp.statusCode == 200) {
        List jsonResp = json.decode(resp.body);

        List<Beer>? listBeer = jsonResp.map((e) => Beer.fromJson(e)).toList();

        ///Description
        if (serchFilter != null && serchFilter != '') {
          Map<String, dynamic>? _queryParameters = {
            ApiConst.pageNumber: pageNumber.toString(),
            ApiConst.pageSize: pageSize.toString(),
          };
          Uri _uri = Uri.https(
              ApiConst.endpointRoot, ApiConst.pathVersion + ApiConst.pathBeer, _queryParameters);

          var resp = await http.get(_uri);
          if (resp.statusCode == 200) {
            List jsonResp = json.decode(resp.body);

            List<Beer>? listBeer2 = jsonResp.map((e) => Beer.fromJson(e)).toList();

            List<Beer> listBeerDescription = [];

            for (Beer beer in listBeer2) {
              if (beer.description != null) {
                if (beer.description!.contains(serchFilter)) {
                  listBeerDescription.add(beer);
                }
              }
            }
            listBeer = [...listBeer, ...listBeerDescription];
          }
        }

        return listBeer;
      } else {
        return List.empty();
      }
    } else {
      return List.empty();
    }
  }
}
