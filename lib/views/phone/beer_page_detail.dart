import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/api/localize_text.dart';
import 'package:world_beers_test_flutter/constants/design_const.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/utils/media_helper.dart';
import 'package:world_beers_test_flutter/widgets/organisms/app_bar.dart';
import 'package:world_beers_test_flutter/widgets/organisms/beer_tile_details.dart';

class BeerPageDetail extends StatefulWidget {
  const BeerPageDetail({Key? key, required this.beer}) : super(key: key);

  final Beer beer;

  @override
  State<BeerPageDetail> createState() => _BeerPageDetailState();
}

class _BeerPageDetailState extends State<BeerPageDetail> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    serviceIntl.setContext(context);
    size = Size(
        mHelper.getSize(context).width, mHelper.getSize(context).height - DesignConst.heightAppBar);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return appBar(nameBeer : widget.beer.name);
  }

  _buildBody() {
    return beerTileDetails(beer: widget.beer, size: size, detailBeer: () {});
  }
}
