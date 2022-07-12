import 'package:flutter/material.dart';

class MyNavigationService {
  pop() {}
  navigateTo(context, routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
