import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class S {
  S(this.locale);

  final Locale locale;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationesDelegete delegate = LocalizationesDelegete();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Register': 'Don´t have an account yet? join now',
      'SingIn': 'Sing In',
      'Login': 'Login',
      'Email': 'Email',
      'Guest': 'Guest',
      'AppName': 'Fake Store',
      'UserName': 'User name',
      'Password': 'Password',
      'Buy': 'Buy',
    },
    'es': {
      'Register': '¿Todavía no tienes una cuenta? Únete ahora',
      'SingIn': 'Registrarse',
      'Login': 'Iniciar sesión',
      'Email': 'Correo electrónico',
      'Guest': 'Invitado',
      'AppName': 'Fake Store',
      'UserName': 'Nombre usuario',
      'Password': 'Contraseña',
      'Buy': 'Comprar',
    },
  };

  String get appName {
    return _localizedValues[locale.languageCode]!['AppName'] ?? '';
  }

  String get singIn {
    return _localizedValues[locale.languageCode]!['SingIn'] ?? '';
  }

  String get login {
    return _localizedValues[locale.languageCode]!['Login'] ?? '';
  }

  String get email {
    return _localizedValues[locale.languageCode]!['Email'] ?? '';
  }

  String get guest {
    return _localizedValues[locale.languageCode]!['Guest'] ?? '';
  }

  String get register {
    return _localizedValues[locale.languageCode]!['Register'] ?? '';
  }

  String get userName {
    return _localizedValues[locale.languageCode]!['UserName'] ?? '';
  }

  String get password {
    return _localizedValues[locale.languageCode]!['Password'] ?? '';
  }

  String get buy {
    return _localizedValues[locale.languageCode]!['Buy'] ?? '';
  }
}

class LocalizationesDelegete extends LocalizationsDelegate<S> {
  const LocalizationesDelegete();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(S(locale));
  }

  @override
  bool shouldReload(LocalizationesDelegete old) => false;
}
