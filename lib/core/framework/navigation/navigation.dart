import 'package:flutter/material.dart';

Future<T?> pushTo<T>(
  BuildContext context,
  Widget page, {
  RouteSettings? settings,
}) async {
  return await Navigator.push<T>(
    context,
    MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
    ),
  );
}

Future<T> pushReplacementTo<T>(
  BuildContext context,
  Widget page,
) async {
  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

Future<void> pushToAndClearStack(BuildContext context, Widget page) {
  return Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

void pop<T>(BuildContext context, [T? value]) {
  return Navigator.pop<T>(context, value);
}

Future<T?> pushNamed<T>(BuildContext context, String name) {
  return Navigator.of(context).pushNamed<T>(name);
}

Future<T?> pushReplacementNamed<T, K>(BuildContext context, String name) {
  return Navigator.of(context).pushReplacementNamed<T, K>(name);
}

enum PushStyle { material, cupertino }
