import 'package:care_notes/common_widgets/simple.dart';
import 'package:care_notes/constants.dart';
import 'package:care_notes/helpers.dart';
import 'package:care_notes/pages/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HABCHomePage extends StatefulWidget {
  const HABCHomePage({Key? key}) : super(key: key);

  @override
  _HABCHomePageState createState() => _HABCHomePageState();
}

class _HABCHomePageState extends State<HABCHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's check in"),
      ),
      body: ListView(
        children: [
          Container(
            height: 130,
            color: Constants.light_blue,
          ),
          const InfoArea(),
          const NavArea()
        ],
      ),
    );
  }
}

class InfoArea extends StatelessWidget {
  const InfoArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      color: Constants.orange,
      child: RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 22.0, height: 1.3),
          children: <TextSpan>[
            TextSpan(text: "The "),
            TextSpan(
                text: "Healthy Aging Brain Care Monitor ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    "(HABC Monitor) is designed for you as a caregiver to monitor and manage your care receiver's health. "),
          ],
        ),
      ),
    );
  }
}

class NavArea extends StatelessWidget {
  const NavArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavItem(
          icon: CupertinoIcons.add_circled,
          text: "Start a new assessment",
          onTap: () {
            Helper.navigate(context, OnboardingPage());
          },
        ),
        const ThinDivider(),
        NavItem(
          icon: Icons.bar_chart,
          text: "See past reports",
          onTap: () {},
        ),
        const ThinDivider(),
        NavItem(
          icon: CupertinoIcons.info_circle,
          text: "Learn about the assessment",
          onTap: () {},
        ),
      ],
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const NavItem(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 23),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Icon(
                icon,
                size: 34,
              ),
            ),
            Text(
              text,
            )
          ],
        ),
      ),
    );
  }
}
