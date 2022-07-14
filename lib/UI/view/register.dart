import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';

import '../../config/app_colors.dart';
import '../../config/size_config.dart';
import '../../locator.dart';
import '../../viewmodel/login_view_model.dart';
import '../widget/main_button.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";
  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MVVM<LoginViewModel>.builder(
      viewModel: locator<LoginViewModel>(),
      disposeVM: false,
      viewBuilder: (_, viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(30),
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
                          'Welcome to Resfast',
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
                          'Create your account and get started',
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
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? "Enter a valid email"
                                  : null,
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
                          height: height(30),
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
                          height: height(61),
                        ),
                        MainButton(
                            text: ("Sign up"),
                            press: () async {
                              if (_formKey.currentState!.validate()) {
                                await viewModel.createUserWithEmailAndPassword(
                                    viewModel.emailController.text,
                                    viewModel.passwordController.text);
                                Navigator.pop(context);
                              }

                              ///////////////////////////////////////////////////
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
