import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resfast/UI/widget/wrapper.dart';
import 'package:resfast/router.dart';

import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    setupLocator();

    runApp(const MyApp());
  } catch (error) {
    (error);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'resfast',
      theme: ThemeData(),
      routes: routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const Wrapper());
      },
    );
  }
}
