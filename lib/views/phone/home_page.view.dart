import 'package:flutter/material.dart';
import 'package:world_beers_test_flutter/api/localize_text.dart';
import 'package:world_beers_test_flutter/constants/design_const.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/utils/media_helper.dart';
import 'package:world_beers_test_flutter/viewmodels/home_page.viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:world_beers_test_flutter/widgets/organisms/app_bar.dart';
import 'package:world_beers_test_flutter/widgets/organisms/beer_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homePageVM = HomePageVM();

  final _controllerSerach = TextEditingController();
  final _scrollController = ScrollController();
  bool isLoading = false;

  late int pageNumber;
  late int pageSize;

  @override
  void initState() {
    super.initState();
    _controllerSerach.addListener(searchAction);
    pageNumber = 1;
    pageSize = 25;
    _homePageVM.getBeers(pageNumber: pageNumber, pageSize: pageSize);
  }

  @override
  Widget build(BuildContext context) {
    serviceIntl.setContext(context);
    return Scaffold(
        appBar: _buildAppBar(),
        body: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: _buildBody(context),
        ));
  }

  _buildAppBar() {
    return appBar(controllerSearch: _controllerSerach);
  }

  _buildBody(BuildContext context) {
    return ChangeNotifierProvider<HomePageVM>(
        create: (BuildContext context) => _homePageVM,
        child: Consumer<HomePageVM>(
          builder: (context, v, ___) => _buildList(context, list: v.beers!),
        ));
  }

  _buildList(BuildContext context, {required List<Beer> list}) {
    Size size = Size(
        mHelper.getSize(context).width, mHelper.getSize(context).height - DesignConst.heightAppBar);
    return ListView.builder(
        controller: _scrollController,
        itemCount: list.length,
        itemBuilder: (context, index) => beerTile(
            beer: list.elementAt(index),
            size: size,
            detailBeer: () => _homePageVM.toBeerDetail(beer: list.elementAt(index))));
  }

  searchAction() {
    _homePageVM.getBeers(
        serchFilter: _controllerSerach.text, pageNumber: pageNumber, pageSize: pageSize);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
      setState(() {
        isLoading = true;
        pageNumber++;
      });
      _homePageVM.getBeers(listBeer: _homePageVM.beers, pageNumber: pageNumber, pageSize: pageSize);
    }
    return false;
  }
}
