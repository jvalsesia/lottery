import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottery/common/contants.dart';
import 'package:lottery/common/icon_content.dart';
import 'package:lottery/common/reusable_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 240),
          const Text("Lottery", style: kTitleTextStyle),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColor: kDarkGreyButtonColor,
                  cardChild: const IconContent(
                    iconData: FontAwesomeIcons.dollarSign,
                    iconColor: kBlackLabelColor,
                    iconLabel: 'Mega Sena',
                    iconLabelColor: kBlackLabelColor,
                  ),
                  cardHeight: 170.0,
                  cardWidth: 170.0,
                  onPress: () {
                    context.pushReplacement('/megasena');
                  },
                )),
                Expanded(
                    child: ReusableCard(
                  cardColor: kDarkGreyButtonColor,
                  cardChild: const IconContent(
                    iconData: FontAwesomeIcons.dollarSign,
                    iconColor: kBlackLabelColor,
                    iconLabel: 'Mega Millions',
                    iconLabelColor: kBlackLabelColor,
                  ),
                  cardHeight: 170.0,
                  cardWidth: 170.0,
                  onPress: () {
                    context.pushReplacement('/megamillions');
                  },
                )),
              ],
            ),
          ),
          const SizedBox(height: 240),
        ],
      ),
    );
  }
}
