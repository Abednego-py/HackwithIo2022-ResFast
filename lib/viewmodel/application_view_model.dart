import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pmvvm/view_model.dart';
import 'package:resfast/UI/view/home.dart';
import 'package:resfast/const.dart';
import 'package:top_alert_notification/top_alert_notification.dart';

import '../config/app_colors.dart';

class ApplicationViewModel extends ViewModel {
  final myController = TextEditingController();
  var NameController = TextEditingController();
  var AddressController = TextEditingController();
  var contactMailController = TextEditingController();
  var contactPhoneNumberController = TextEditingController();
  var complaintController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Future registerUni() async {
    if (NameController.text.isNotEmpty &&
        AddressController.text.isNotEmpty &&
        contactPhoneNumberController.text.isNotEmpty &&
        contactMailController.text.isNotEmpty &&
        complaintController.text.isNotEmpty) {
      var response = await http.post(Uri.parse(url),
          body: ({
            'fullName': NameController.text,
            'phoneNumber': contactPhoneNumberController.text.toString(),
            'address': AddressController.text,
            'email': contactMailController.text,
            'complaint': complaintController.text,
          }));
      print("body");
      print(response);
      print(response.body);
      if (response.statusCode == 200) {
        TopAlertNotification(
                context,
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: const [
                      Text(
                        'Complaint registered',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: kSecondaryColor),
                      ),
                      Text(
                        '!!!',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                closeOnX: true,
                color: notificationColor,
                duration: const Duration(seconds: 3))
            .showTopAlert();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        print(response.statusCode);
        print(response.body);
        TopAlertNotification(
                context,
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      const Text(
                        'Invalid credential',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: kSecondaryColor),
                      ),
                      Text(
                        '!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.red[400]),
                      )
                    ],
                  ),
                ),
                closeOnX: true,
                color: notificationColor,
                duration: const Duration(seconds: 3))
            .showTopAlert();
      }
    } else {
      TopAlertNotification(
              context,
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const Text(
                      'Empty field',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: kSecondaryColor),
                    ),
                    Text(
                      '!!!',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.red[400]),
                    )
                  ],
                ),
              ),
              closeOnX: true,
              color: notificationColor,
              duration: const Duration(seconds: 3))
          .showTopAlert();
    }
  }

  String? onChanged(value, removeError) {
    if (value!.isNotEmpty) {
      return removeError(error: kEmailNullError);
    } else if (emailValidatorRegExp.hasMatch(value)) {
      return removeError(error: kInvalidEmailError);
    } else {
      return null;
    }
  }
}
