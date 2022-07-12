import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:resfast/UI/view/home.dart';
import 'package:resfast/UI/view/login.dart';
import 'package:resfast/model/user_model.dart';

import '../../locator.dart';
import '../../viewmodel/login_view_model.dart';

class Wrapper extends StatelessWidget {
  static String routeName = "/wrapper";
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<LoginViewModel>.builder(
        viewModel: locator<LoginViewModel>(),
        disposeVM: false,
        viewBuilder: (_, viewModel) => StreamBuilder<User?>(
            stream: viewModel.user,
            builder: (_, AsyncSnapshot<User?> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final User? user = snapshot.data;
                return user == null ? LoginScreen() : const Home();
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }));
  }
}
