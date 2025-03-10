import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  Locale? locale;
  DemoLocalizations(this.locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  Map<dynamic, dynamic>? _loaclizedValues;

  Map flattedTransaction(Map<dynamic, dynamic> json, [String prifix = '']) {
    final Map<dynamic, dynamic> translations = {};
    json.forEach((dynamic key, dynamic value) {
      if (value is Map) {
        translations.addAll(flattedTransaction(value, '$prifix$key.'));
      } else {
        translations['$prifix$key'] = value.toString();
      }
    });
    return translations;
  }

  Future load() async {
    String jsonStringValues = await rootBundle
        .loadString('assets/languages/${locale?.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _loaclizedValues = flattedTransaction(mappedJson);
  }

  String getTransalateValue(String key) {
    return _loaclizedValues![key] ?? key;
  }

  static const LocalizationsDelegate<DemoLocalizations> delegate =
      DemoLocalizationsDelegate();

  static DemoLocalizations get instance => DemoLocalizationsDelegate.instance!;
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  static DemoLocalizations? instance;

  @override
  bool isSupported(Locale locale) =>
      ['en', 'hi', 'id', 'zh', 'ar'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localizations = DemoLocalizations(locale);
    await localizations.load();
    instance = localizations;
    return localizations;
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
