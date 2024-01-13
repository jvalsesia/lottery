import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.iconLabel,
    required this.iconLabelColor,
  });

  final IconData iconData;
  final Color iconColor;
  final String iconLabel;
  final Color iconLabelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 50.0,
          color: iconColor,
        ),
        const SizedBox(height: 15.0),
        Text(
          iconLabel,
          style: TextStyle(fontSize: 18.0, color: iconLabelColor),
        )
      ],
    );
  }
}
