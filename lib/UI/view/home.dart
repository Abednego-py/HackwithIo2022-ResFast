import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:resfast/config/size_config.dart';

import '../../config/app_colors.dart';
import '../../locator.dart';
import '../../viewmodel/login_view_model.dart';

class Home extends StatelessWidget {
  static String routeName = "/homeScreen";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Resfast",
                      style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: white,
                          ),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              //offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 450,
                          child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: <Widget>[
                              CategoryCard(
                                title: "Chat with a doctor",
                                image: "assets/chat.jpg",
                                press: () {
                                  viewModel.communicate();
                                },
                              ),
                              CategoryCard(
                                title: "Fill a form",
                                image: "assets/form.jpg",
                                press: () {
                                  Navigator.pushNamed(
                                      context, "/RegisterComplain");
                                },
                              ),
                              CategoryCard(
                                title: "Book an appoint",
                                image: "assets/appoint.png",
                                press: () {},
                              ),
                              CategoryCard(
                                title: "Make a call",
                                image: "assets/phone-call.png",
                                press: () {},
                              ),
                            ],
                          ),
                        ),
                      ))
                ])));
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? press;
  const CategoryCard({
    required this.image,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: notificationColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(
                    image,
                    height: 100,
                    width: 80,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
