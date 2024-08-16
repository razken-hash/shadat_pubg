import 'package:flutter/material.dart';

class MyLocalizationDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  final MyLocalization mylocalization;

  MyLocalizationDelegate(this.mylocalization);

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<WidgetsLocalizations> load(Locale locale) async => mylocalization;

  @override
  bool shouldReload(MyLocalizationDelegate old) => false;
}

class MyLocalization implements WidgetsLocalizations {
  @override
  TextDirection get textDirection => TextDirection.rtl;

  @override
  String get reorderItemDown => throw UnimplementedError();

  @override
  String get reorderItemLeft => throw UnimplementedError();

  @override
  String get reorderItemRight => throw UnimplementedError();

  @override
  String get reorderItemToEnd => throw UnimplementedError();

  @override
  String get reorderItemToStart => throw UnimplementedError();

  @override
  String get reorderItemUp => throw UnimplementedError();
}
