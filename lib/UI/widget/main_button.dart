import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/size_config.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    this.text,
    this.press,
    IconData? icon,
  }) : super(key: key);
  final String? text;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            padding: EdgeInsets.fromLTRB(
                width(32), height(13), width(18.25), height(17)),
            decoration: BoxDecoration(
              border: Border.all(
                  color: primaryColor, // Set border color
                  width: 1.0),
              color: inputFillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text!,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 24)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
