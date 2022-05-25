import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../common_widgets/simple.dart';
import '../constants.dart';

class AssessmentPage extends StatefulWidget {
  AssessmentPage({Key? key}) : super(key: key);

  final PageController controller = PageController();
  StreamController<int>? pageNo;

  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
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
        title: const Text("Measure your health"),
      ),
      body: Column(
        children: [
          Expanded(
              child: AssessmentSlides(
            controller: widget.controller,
            pageNumberStream: widget.pageNo,
          )),
          const ThinDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      if (currentPage > 0) {
                        widget.controller.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      }
                    },
                    child: Visibility(
                        visible: currentPage > 0,
                        child: const Text(
                          "BACK",
                          style:
                              TextStyle(color: Constants.gray2, fontSize: 18),
                        ))),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Text((currentPage + 1).toString() + " of 3"),
                )),
                TextButton(
                    onPressed: () {
                      if (currentPage == 2) {
                        // Helper.navigate(context, const AssessmentPage());
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

class AssessmentSlides extends StatelessWidget {
  final PageController controller;
  final StreamController<int>? pageNumberStream;

  const AssessmentSlides(
      {Key? key, required this.controller, required this.pageNumberStream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const <Widget>[
        AssessmentItem(
          color: Colors.pinkAccent,
          name: "COGNITIVE ASSESSMENT",
          mainText:
              "Handling complicated financial affairs such as balancing checkbook, income taxes & pay bills.",
        ),
        AssessmentItem(
          color: Colors.lightBlueAccent,
          name: "FUNCTIONAL ASSESSMENT",
          mainText: "Planning, preparing, or serving meals",
        ),
        AssessmentItem(
          color: Color(0xff79c9c7),
          name: "EMOTIONAL ASSESSMENT",
          mainText: "Feeling down, depressed, or hopeless",
        ),
      ],
      onPageChanged: (pageNo) {
        pageNumberStream?.add(pageNo);
      },
    );
  }
}

class AssessmentItem extends StatelessWidget {
  final String name;
  final Color color;
  final String topText;
  final String mainText;

  const AssessmentItem(
      {Key? key,
      required this.name,
      required this.color,
      this.topText =
          "Over the past two weeks, how often did Stephanie have problems with:",
      required this.mainText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          width: double.infinity,
          color: color,
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Text(
            topText,
            style: TextStyle(fontSize: 18, color: Colors.grey[500]),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Text(
            mainText,
            style: TextStyle(fontSize: 36, color: Colors.grey[600]),
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DaySlider(color: color),
            Padding(padding: EdgeInsets.only(top: 40))
          ],
        ))
      ],
    );
  }
}

class DaySlider extends StatefulWidget {
  final Color color;

  const DaySlider({Key? key, required this.color}) : super(key: key);

  @override
  _DaySliderState createState() => _DaySliderState();
}

class _DaySliderState extends State<DaySlider> {
  double days = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Row(
            children: [
              RangeText(
                text: "Not at all",
                active: days > 0,
              ),
              RangeText(
                text: "Several days",
                active: days > 1,
              ),
              RangeText(
                text: "Most days",
                active: days > 2,
              ),
              RangeText(
                text: "Almost daily",
                active: days > 3,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Row(
            children: [
              NumberedRange(
                active: days > 0,
                range: "0-1",
                dayText: "DAY",
                color: widget.color,
                index: 0,
                onClick: () {
                  setState(() {
                    days = 0.5;
                  });
                },
              ),
              NumberedRange(
                active: days > 1,
                range: "2-6",
                dayText: "DAYS",
                color: widget.color,
                index: 1,
                onClick: () {
                  setState(() {
                    days = 1.5;
                  });
                },
              ),
              NumberedRange(
                active: days > 2,
                range: "7-11",
                dayText: "DAYS",
                color: widget.color,
                index: 2,
                onClick: () {
                  setState(() {
                    days = 2.5;
                  });
                },
              ),
              NumberedRange(
                active: days > 3,
                range: "12-14",
                dayText: "DAYS",
                color: widget.color,
                index: 3,
                onClick: () {
                  setState(() {
                    days = 3.5;
                  });
                },
              ),
            ],
          ),
        ),
        SfSlider(
            min: 0,
            max: 4,
            interval: 1,
            stepSize: 0.5,
            showTicks: true,
            minorTicksPerInterval: 1,
            value: days,
            activeColor: Colors.grey[400],
            inactiveColor: Colors.grey[400],
            tickShape: EmptyTick(),
            onChanged: (newVal) {
              setState(() {
                days = newVal;
                if (days < 0.5) {
                  days = 0.5;
                } else if (days > 3.5) {
                  days = 3.5;
                } else if ((days - 0.5) % 1 != 0) {
                  days = (days - 0.5).round().toDouble() + 0.5;
                }
              });
            }),
      ],
    );
  }
}

class NumberedRange extends StatelessWidget {
  final bool active;
  final String range;
  final String dayText;
  final Color color;
  final int index;
  final VoidCallback onClick;

  const NumberedRange(
      {Key? key,
      required this.active,
      required this.range,
      required this.dayText,
      required this.color,
      required this.index,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onClick,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.only(right: 1, top: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: active ? color : Colors.white,
              borderRadius: index == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))
                  : index == 3
                      ? const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))
                      : null),
          child: Column(
            children: [
              Text(
                range,
                style: TextStyle(
                    color: active ? Colors.white : Colors.grey[500],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dayText,
                style: TextStyle(
                    color: active ? Colors.white : Colors.grey[500],
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    ));
  }
}

class RangeText extends StatelessWidget {
  final String text;
  final bool active;

  const RangeText({Key? key, required this.text, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 10),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: active ? Colors.grey[600] : Colors.grey[400]),
        ),
      ),
    );
  }
}

class EmptyTick extends SfTickShape {
  @override
  Size getPreferredSize(SfSliderThemeData themeData) {
    return const Size(0, 0);
  }
}
