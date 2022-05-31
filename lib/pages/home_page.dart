import 'package:care_notes/constants.dart';
import 'package:care_notes/pages/habc_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../helpers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          width: 2 * MediaQuery.of(context).size.width / 3,
          color: Constants.light_blue,
          height: double.infinity,
        ),
        appBar: AppBar(
          title: const Text("CareNotes"),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 8,
              child: TopArea(),
            ),
            const Expanded(flex: 6, child: NavRow()),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: const Text("About CareNotes"),
            )
          ],
        ));
  }
}

class TopArea extends StatelessWidget {
  const TopArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Constants.light_blue,
        padding: EdgeInsets.symmetric(vertical: 28, horizontal: 28),
        child: Column(
          children: [
            const Text(
              "Need help with Stephanie? We've got you covered.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: /*50*/ 40,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Constants.dark_purple),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: const Text(
                  "Discover advice and tips",
                  style: TextStyle(fontSize: /*22*/ 18),
                ),
              ),
            ))
          ],
        ));
  }
}

class NavRow extends StatelessWidget {
  static const double sideMargin = 14;

  const NavRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CardButton(
          textColor: Constants.orange,
          title: "Let's check in.",
          text: "Health Aging Brain Care (HABC) Monitor Assessments",
          margin:
              const EdgeInsets.only(left: sideMargin, right: sideMargin / 2),
          onClick: () {
            Helper.navigate(context, const HABCHomePage());
          },
        )),
        Expanded(
            child: CardButton(
          textColor: Constants.gray3,
          title: "External Resources",
          text:
              "Find resources about legal, medical, social, or housing issues.",
          margin:
              const EdgeInsets.only(right: sideMargin, left: sideMargin / 2),
          onClick: () {},
        ))
      ],
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    Key? key,
    required this.textColor,
    required this.title,
    required this.text,
    required this.onClick,
    required this.margin,
  }) : super(key: key);
  final Color textColor;
  final String title;
  final String text;
  final Function() onClick;

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: onClick,
        child: Card(
          margin: margin,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.all(16),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: /*30*/ 26,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 18),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Constants.gray2),
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Constants.gray1,
                    size: /*40*/ 30,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
