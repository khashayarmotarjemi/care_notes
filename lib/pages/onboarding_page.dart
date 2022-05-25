import 'dart:async';

import 'package:care_notes/common_widgets/simple.dart';
import 'package:care_notes/constants.dart';
import 'package:care_notes/helpers.dart';
import 'package:care_notes/pages/assessment_page.dart';
import 'package:care_notes/pages/onboarding_widgets.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final PageController controller = PageController();
  StreamController<int>? pageNo;

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.pageNo == null) {
      widget.pageNo = StreamController();
      widget.pageNo?.stream.listen((event) {
        setState(() {
          currentPage = event;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthy Aging Brain Care"),
      ),
      body: Column(
        children: [
          Expanded(
              child: OnboardingSlides(
            controller: widget.controller,
            pageNumberStream: widget.pageNo,
          )),
          const ThinDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Row(
              children: [
                currentPage > 0
                    ? TextButton(
                        onPressed: () {
                          widget.controller.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "BACK",
                          style:
                              TextStyle(color: Constants.gray2, fontSize: 18),
                        ))
                    : Container(),
                Expanded(child: Container()),
                TextButton(
                    onPressed: () {
                      if (currentPage == 2) {
                        Helper.navigate(context, AssessmentPage());
                      } else {
                        widget.controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        setState(() {});
                      }
                    },
                    child: const Text(
                      "NEXT",
                      style: TextStyle(color: Colors.lightGreen, fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingSlides extends StatelessWidget {
  final PageController controller;
  final StreamController<int>? pageNumberStream;

  const OnboardingSlides(
      {Key? key, required this.controller, required this.pageNumberStream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const <Widget>[
        OnboardingCardArea(
          texts: <TextSpan>[
            TextSpan(
                text:
                    "The Health Aging Brain Care Monitor is broken down into"),
            TextSpan(
                text: " four ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "sections."),
          ],
          mainArea: OutlineArea(),
        ),
        OnboardingCardArea(
          texts: <TextSpan>[
            TextSpan(
                text:
                    "On each question, estimate how often you've seen the behavior over the last"),
            TextSpan(
                text: " two weeks. ",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
          mainArea: DateRangeArea(),
        ),
        OnboardingCardArea(
          texts: <TextSpan>[
            TextSpan(
                text:
                    "At the end, you'll get a report with details about Stephanie's health."),
          ],
          mainArea: ResultsArea(),
        ),
      ],
      onPageChanged: (pageNo) {
        pageNumberStream?.add(pageNo);
      },
    );
  }
}

