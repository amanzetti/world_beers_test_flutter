import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:world_beers_test_flutter/api/locale_provider.dart';
import 'package:world_beers_test_flutter/constants/colors_app.dart';
import 'package:world_beers_test_flutter/constants/route_name.dart';
import 'package:world_beers_test_flutter/l10n/l10n.dart';
import 'package:world_beers_test_flutter/models/beer.dart';
import 'package:world_beers_test_flutter/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:world_beers_test_flutter/views/phone/beer_page_detail.dart';
import 'package:world_beers_test_flutter/views/phone/home_page.view.dart';
import 'package:world_beers_test_flutter/views/phone/unknown_page.view.dart';

class WorldBeers extends StatefulWidget {
  const WorldBeers({Key? key}) : super(key: key);

  @override
  State<WorldBeers> createState() => _WorldBeersState();
}

class _WorldBeersState extends State<WorldBeers> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: ((context) => LocaleProvider()),
        builder: (context, _) {
          final _provider = Provider.of<LocaleProvider>(context);
          return MaterialApp(
            ///intl
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            locale: _provider.locale, 

            ///Nav
            navigatorKey: RouteNavigator.navigatorKey,
            onGenerateRoute: (settings) {
              late Widget _page;
              if (settings.name == RouteName.pathHome || settings.name == RouteName.pathRoot) {
                _page = const HomePage();
              } else if (settings.name == RouteName.pathBeerDetail) {
                _page = BeerPageDetail(
                  beer: settings.arguments as Beer,
                );
              } else {
                _page = const UnknowPage();
              }

              return MaterialPageRoute(
                settings: settings,
                builder: (context) {
                  return _page;
                },
              );
            },
            theme: ThemeData(scaffoldBackgroundColor: ColorsApp.scaffold),
          );
        });
  }
}