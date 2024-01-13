import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottery/common/bets.dart';
import 'package:lottery/common/contants.dart';
import 'package:lottery/common/reusable_card.dart';

class MegaMillionsPage extends StatefulWidget {
  const MegaMillionsPage({super.key});

  @override
  State<MegaMillionsPage> createState() => _MegaMillionsPageState();
}

class _MegaMillionsPageState extends State<MegaMillionsPage> {
  List<int> selectedNumbers5 = [];
  List<int> selectedNumber1 = [];
  String formattedDate = "";
  Bets bets = const Bets();
  @override
  void initState() {
    super.initState();
    _bet();
  }

  Future<List<int>> betAsync() => bets.playMM();

  void _bet() {
    setState(() {
      formattedDate =
          DateFormat('dd-MM-yyyy – kk:mm:ss').format(DateTime.now());
      betAsync().then((value) => selectedNumbers5 = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
        future: betAsync(),
        builder: (context, AsyncSnapshot<List<int>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Mega Millions", style: kTitleTextStyle),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableCard(
                          cardColor: kAppLightBlueBackgroundColor,
                          cardChild: Center(
                            child: Text(
                              snapshot.data![0] < 10
                                  ? '0${snapshot.data![0]}'
                                  : '${snapshot.data![0]}',
                              style: kBmiTextStyle,
                            ),
                          ),
                          cardHeight: 200,
                          cardWidth: 200,
                          onPress: () {}),
                      ReusableCard(
                          cardColor: kAppLightBlueBackgroundColor,
                          cardChild: Center(
                            child: Text(
                              snapshot.data![1] < 10
                                  ? '0${snapshot.data![1]}'
                                  : '${snapshot.data![1]}',
                              style: kBmiTextStyle,
                            ),
                          ),
                          cardHeight: 200,
                          cardWidth: 200,
                          onPress: () {}),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableCard(
                          cardColor: kAppLightBlueBackgroundColor,
                          cardChild: Center(
                            child: Text(
                              snapshot.data![2] < 10
                                  ? '0${snapshot.data![2]}'
                                  : '${snapshot.data![2]}',
                              style: kBmiTextStyle,
                            ),
                          ),
                          cardHeight: 200,
                          cardWidth: 200,
                          onPress: () {}),
                      ReusableCard(
                          cardColor: kAppLightBlueBackgroundColor,
                          cardChild: Center(
                            child: Text(
                              snapshot.data![3] < 10
                                  ? '0${snapshot.data![3]}'
                                  : '${snapshot.data![3]}',
                              style: kBmiTextStyle,
                            ),
                          ),
                          cardHeight: 200,
                          cardWidth: 200,
                          onPress: () {}),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableCard(
                          cardColor: kAppLightBlueBackgroundColor,
                          cardChild: Center(
                            child: Text(
                              snapshot.data![4] < 10
                                  ? '0${snapshot.data![4]}'
                                  : '${snapshot.data![4]}',
                              style: kBmiTextStyle,
                            ),
                          ),
                          cardHeight: 200,
                          cardWidth: 200,
                          onPress: () {}),
                      ReusableCard(
                          cardColor: kAppWhiteBackgroundColor,
                          cardChild: Center(
                            child: Text(
                              snapshot.data![5] < 10
                                  ? '0${snapshot.data![5]}'
                                  : '${snapshot.data![5]}',
                              style: kBmiTextStyle,
                            ),
                          ),
                          cardHeight: 200,
                          cardWidth: 200,
                          onPress: () {}),
                    ],
                  ),
                  Text(formattedDate, style: kHintDarkTextStyle),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => {context.pushReplacement('/home')},
                        style: ElevatedButton.styleFrom(
                            elevation: 30,
                            backgroundColor: kVeryDarkGreyButtonColor,
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: kWhiteLabelColor,
                            ),
                            Text(
                              "Back",
                              style: kWhiteLabelTextStyle,
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          _bet(),
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 30,
                            backgroundColor: kDarkGreyButtonColor,
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FontAwesomeIcons.repeat,
                              color: kBlackLabelColor,
                            ),
                            Text(
                              "Repeat",
                              style: kBlackLabelTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
