import 'package:flutter/material.dart';

class CurrentPage {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const CurrentPage(
      {required this.name, required this.route, required this.builder});
}
