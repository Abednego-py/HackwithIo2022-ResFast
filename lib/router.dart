import 'package:flutter/cupertino.dart';
import 'package:resfast/UI/view/home.dart';
import 'package:resfast/UI/view/register.dart';
import 'package:resfast/UI/widget/wrapper.dart';

import 'UI/view/login.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => const Wrapper(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Home.routeName: (context) => const Home(),
};
