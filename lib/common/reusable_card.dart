import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.cardColor,
    required this.cardChild,
    required this.cardHeight,
    required this.cardWidth,
    required this.onPress,
  });

  final Color cardColor;
  final Widget cardChild;
  final double cardHeight;
  final double cardWidth;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Card(
        margin: const EdgeInsets.all(15.0),
        elevation: 30,
        color: cardColor,
        child: cardChild,
      ),
    );
  }
}
