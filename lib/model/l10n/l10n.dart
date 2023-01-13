import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Localizationes {
  Localizationes(this.locale);

  final Locale locale;

  static Localizationes? of(BuildContext context) {
    return Localizations.of<Localizationes>(context, Localizationes);
  }

  static const LocalizationesDelegete delegate = LocalizationesDelegete();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Hello': 'Hello World',
    },
    'es': {
      'Hello': 'Hola Mundo',
    },
  };

  String get hello {
    return _localizedValues[locale.languageCode]!['Hello'] ?? '';
  }
}

class LocalizationesDelegete extends LocalizationsDelegate<Localizationes> {
  const LocalizationesDelegete();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<Localizationes> load(Locale locale) {
    return SynchronousFuture<Localizationes>(Localizationes(locale));
  }

  @override
  bool shouldReload(LocalizationesDelegete old) => false;
}