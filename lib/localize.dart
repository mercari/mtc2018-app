import "package:flutter/material.dart";
import "dart:async";
import 'package:flutter/foundation.dart' show SynchronousFuture;

class MtcLocalizations {
  MtcLocalizations(this.locale);

  final Locale locale;

  static MtcLocalizations of(BuildContext context) {
    return Localizations.of<MtcLocalizations>(context, MtcLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'news_title': 'News',
    },
    'ja': {
      'news_title': 'お知らせ',
    },
  };

  String get newsTitle {
    return _localizedValues[locale.languageCode]['news_title'];
  }
}

class MtcLocalizationsDelegate extends LocalizationsDelegate<MtcLocalizations> {
  const MtcLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<MtcLocalizations> load(Locale locale) {
    return SynchronousFuture<MtcLocalizations>(MtcLocalizations(locale));
  }

  @override
  bool shouldReload(MtcLocalizationsDelegate old) => false;
}