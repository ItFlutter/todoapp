import 'package:flutter/material.dart';

import '../../../core/constant/dimensions_screen.dart';

class CustomAvatar extends StatelessWidget {
  final String avatarImage;
  const CustomAvatar({Key? key, required this.avatarImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthScreen / 7,
      margin: EdgeInsets.symmetric(
          horizontal: widthScreen / 40, vertical: heightScreen / 100),
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              avatarImage,
            ),
            fit: BoxFit.cover,
          )),
    );
  }
}
