import 'package:flutter/material.dart';

extension RouterContext on BuildContext {
  pushRoute(String routeName) => Navigator.of(this).pushNamed(routeName);

  popRoute() => Navigator.of(this).pop();
}
