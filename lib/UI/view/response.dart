import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:resfast/viewmodel/application_view_model.dart';

import '../../config/app_colors.dart';
import '../../config/size_config.dart';
import '../../locator.dart';
import '../widget/main_button.dart';

// ignore: must_be_immutable
class RegisterPatient extends StatelessWidget {
  static String routeName = "/RegisterComplain";
  const RegisterPatient({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MVVM<ApplicationViewModel>(
      viewModel: locator<ApplicationViewModel>(),
      view: () => _RegisterPatient(),
      disposeVM: false,
    );
  }
}

class _RegisterPatient extends StatelessView<ApplicationViewModel> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget render(context, viewModel) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/homeScreen');
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: kSecondaryColor,
              )),
          title: const Text(
            'RESFAST',
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: kSecondaryColor),
          elevation: 1,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height(31),
                      ),
                      TextFormField(
                        controller: viewModel.NameController,
                        onChanged: (value) {
                          viewModel.onChanged(value, emailValidatorRegExp);
                        },
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                          labelStyle: TextStyle(color: kSecondaryColor),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: height(26),
                      ),
                      TextFormField(
                        controller: viewModel.AddressController,
                        maxLines: 3,
                        onChanged: (value) {
                          viewModel.onChanged(value, emailValidatorRegExp);
                        },
                        decoration: const InputDecoration(
                          labelText: "Address",
                          labelStyle: TextStyle(color: kSecondaryColor),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: height(26),
                      ),
                      TextFormField(
                        controller: viewModel.contactMailController,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? "Enter a valid email"
                                : null,
                        decoration: const InputDecoration(
                          labelText: "Contact Mail",
                          labelStyle: TextStyle(color: kSecondaryColor),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: height(26),
                      ),
                      TextFormField(
                        controller: viewModel.contactPhoneNumberController,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          viewModel.onChanged(value, emailValidatorRegExp);
                        },
                        decoration: const InputDecoration(
                          labelText: "Contact Phonenumber",
                          labelStyle: TextStyle(color: kSecondaryColor),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: height(26),
                      ),
                      TextFormField(
                        controller: viewModel.complaintController,
                        maxLines: 3,
                        onChanged: (value) {
                          viewModel.onChanged(value, emailValidatorRegExp);
                        },
                        decoration: const InputDecoration(
                          labelText:
                              "write a full description of your complaints",
                          labelStyle: TextStyle(color: kSecondaryColor),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: height(26),
                      ),
                      MainButton(
                          text: ("Register"),
                          press: () {
                            //model.isValid?Navigator.pushNamed(context, '/EvnoiaAdmin'):CircularProgressIndicator();
                            if (_formKey.currentState!.validate()) {
                              viewModel.registerUni();
                              // If the form is valid, display a snackbar. In the real world,
                              //  you'd often call a server or save the information in a database.
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text("Registered")),
                              // );
                              // if(model.validatePassword(value, kShortPassError)=null&&){
                              //   Navigator.pushNamed(context, '/EvnoiaAdmin');
                              // }else{
                              //   return null;
                              // }
                              // (value){model.submit(value, emailValidatorRegExp);};

                              // Navigator.pushNamed(context, '/EvnoiaAdmin');
                            }
                          }),
                    ]),
              ),
            )));
  }
}
