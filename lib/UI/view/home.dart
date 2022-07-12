import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:resfast/viewmodel/login_view_model.dart';

import '../../config/app_colors.dart';
import '../../locator.dart';

class Home extends StatelessWidget {
  static String routeName = "/homeScreen";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<LoginViewModel>.builder(
      viewModel: locator<LoginViewModel>(),
      disposeVM: false,
      viewBuilder: (_, viewModel) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: kSecondaryColor),
            elevation: 1,
            actions: [
              TextButton(
                onPressed: () async {
                  await viewModel.signOut();
                },
                child: const Text(
                  'Log out',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto'),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [],
          )),
    );
  }
}
