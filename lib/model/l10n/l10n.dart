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
      'SingIn': 'Sing In',
      'Login' : 'Login',
      'Email' : 'Email',
    },
    'es': {
      'Login': 'Iniciar sesión',
      'SingIn' : 'Registrarse',
      'Email' : 'Correo',
    },
  };

  String get singIn {
    return _localizedValues[locale.languageCode]!['SingIn'] ?? '';
  }

  String get login {
    return _localizedValues[locale.languageCode]!['Login'] ?? '';
  }

  String get email {
    return _localizedValues[locale.languageCode]!['Email'] ?? '';
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