import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizeText extends ChangeNotifier {
  LocalizeText._();
  static LocalizeText instance = LocalizeText._();

  late AppLocalizations _appLocale;

  AppLocalizations get appLocale => _appLocale;

  void setContext(BuildContext context) {
    _appLocale = AppLocalizations.of(context)!;
    notifyListeners();
  }
}

final serviceIntl = LocalizeText.instance;
