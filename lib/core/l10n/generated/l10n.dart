// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Rick and Morty`
  String get rickAndMorty {
    return Intl.message(
      'Rick and Morty',
      name: 'rickAndMorty',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL CHARACTERS`
  String get allCharacters {
    return Intl.message(
      'TOTAL CHARACTERS',
      name: 'allCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Find a character`
  String get findCharacter {
    return Intl.message(
      'Find a character',
      name: 'findCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get characters {
    return Intl.message(
      'Characters',
      name: 'characters',
      desc: '',
      args: [],
    );
  }

  /// `Locations`
  String get location {
    return Intl.message(
      'Locations',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get episods {
    return Intl.message(
      'Episodes',
      name: 'episods',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Character with this name not found`
  String get cannotSearch {
    return Intl.message(
      'Character with this name not found',
      name: 'cannotSearch',
      desc: '',
      args: [],
    );
  }

  /// `Nothing found according to the filter data`
  String get cannotFiltration {
    return Intl.message(
      'Nothing found according to the filter data',
      name: 'cannotFiltration',
      desc: '',
      args: [],
    );
  }

  /// `GENDER`
  String get gender {
    return Intl.message(
      'GENDER',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Species`
  String get species {
    return Intl.message(
      'Species',
      name: 'species',
      desc: '',
      args: [],
    );
  }

  /// `SORT`
  String get sort {
    return Intl.message(
      'SORT',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `STATUS`
  String get status {
    return Intl.message(
      'STATUS',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Throw off`
  String get throwoff {
    return Intl.message(
      'Throw off',
      name: 'throwoff',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `The Zigerions put Jerry and Rick in a simulation to learn the secret of making concentrated dark matter.`
  String get info {
    return Intl.message(
      'The Zigerions put Jerry and Rick in a simulation to learn the secret of making concentrated dark matter.',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `About the app`
  String get about {
    return Intl.message(
      'About the app',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Application Version`
  String get version {
    return Intl.message(
      'Application Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknowngender {
    return Intl.message(
      'Unknown',
      name: 'unknowngender',
      desc: '',
      args: [],
    );
  }

  /// `Alive`
  String get alive {
    return Intl.message(
      'Alive',
      name: 'alive',
      desc: '',
      args: [],
    );
  }

  /// `Dead`
  String get dead {
    return Intl.message(
      'Dead',
      name: 'dead',
      desc: '',
      args: [],
    );
  }

  /// `Asexual`
  String get unknownstatus {
    return Intl.message(
      'Asexual',
      name: 'unknownstatus',
      desc: '',
      args: [],
    );
  }

  /// `By alphabet`
  String get alphabet {
    return Intl.message(
      'By alphabet',
      name: 'alphabet',
      desc: '',
      args: [],
    );
  }

  /// `Edit a profile`
  String get EditProfile {
    return Intl.message(
      'Edit a profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change the photo`
  String get changephoto {
    return Intl.message(
      'Change the photo',
      name: 'changephoto',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Change name`
  String get changename {
    return Intl.message(
      'Change name',
      name: 'changename',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Lastname`
  String get lastname {
    return Intl.message(
      'Lastname',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `Fathers Name`
  String get fathername {
    return Intl.message(
      'Fathers Name',
      name: 'fathername',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
