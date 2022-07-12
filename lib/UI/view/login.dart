import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';

import '../../config/app_colors.dart';
import '../../config/size_config.dart';
import '../../locator.dart';
import '../../viewmodel/login_view_model.dart';
import '../widget/main_button.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/LoginScreen";
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MVVM<LoginViewModel>.builder(
      viewModel: locator<LoginViewModel>(),
      disposeVM: false,
      viewBuilder: (_, viewModel) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height(97),
                      ),
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          fontFamily: "Roboto",
                        ),
                      ),
                      SizedBox(
                        height: height(18),
                      ),
                      const Text(
                        'Input your log in credentials',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Roboto",
                        ),
                      ),
                      SizedBox(
                        height: height(18),
                      ),
                      TextFormField(
                        controller: viewModel.emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: kSecondaryColor),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: height(70),
                      ),
                      TextFormField(
                        controller: viewModel.passwordController,
                        obscureText: viewModel.isPasswordHidden,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return kPassNullError;
                          } else if (value.length < 6) {
                            return "password is too short";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: kSecondaryColor),
                          hintText: "Passsword",
                          suffixIcon: InkWell(
                            onTap: () {
                              viewModel.togglePassword();
                            },
                            child: Icon(
                              viewModel.isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: primaryColor,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          border: const OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: height(31),
                      ),
                      MainButton(
                          text: ("Log In"),
                          press: () {
                            // viewModel.signInWithEmailAndPassword(
                            //     viewModel.emailController.text,
                            //     viewModel.passwordController.text);
                            if (_formKey.currentState!.validate()) {
                              viewModel.signInWithEmailAndPassword(
                                  viewModel.emailController.text,
                                  viewModel.passwordController.text);
                            } else {
                              return;
                            }
                            ///////////////////////////////////////////////////
                          }),
                      SizedBox(
                        height: height(25),
                      ),
                      MainButton(
                          text: ("Sign Up"),
                          press: () {
                            Navigator.pushNamed(context, "/register");
                            ///////////////////////////////////////////////////
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
