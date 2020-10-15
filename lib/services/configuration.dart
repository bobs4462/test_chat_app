import 'package:flutter/material.dart';

class Configuration {
  static final Configuration _configuration = Configuration._internal();
  factory Configuration() {
    return _configuration;
  }
  Configuration._internal();

  double getScreenHeight(BuildContext ctx) {
    return MediaQuery.of(ctx).size.height - MediaQuery.of(ctx).padding.top;
  }

  double getScreenWidth(BuildContext ctx) {
    return MediaQuery.of(ctx).size.width;
  }
}
