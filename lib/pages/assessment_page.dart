import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AssessmentPage extends StatelessWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Measure your health"),
      ),
      body: const DaySlider(
        color: Colors.red,
      ),
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
  double days = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Row(
            children: [
              NumberedRange(
                active: days > 0,
                range: "0-1",
                dayText: "DAY",
                color: widget.color,
              ),
              NumberedRange(
                active: days > 1,
                range: "2-6",
                dayText: "DAYS",
                color: widget.color,
              ),
              NumberedRange(
                active: days > 2,
                range: "7-11",
                dayText: "DAYS",
                color: widget.color,
              ),
              NumberedRange(
                active: days > 3,
                range: "12-14",
                dayText: "DAYS",
                color: widget.color,
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
            tickShape: EmptyTick(),
            onChanged: (newVal) {
              setState(() {
                days = newVal;
                if ((days - 0.5) % 1 != 0) {
                  days = (days-0.5).round().toDouble() + 0.5;
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

  const NumberedRange(
      {Key? key,
      required this.active,
      required this.range,
      required this.dayText,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 65,
      color: active ? color : Colors.white,
      alignment: Alignment.center,
      child: Text(active.toString()),
    ));
  }
}

class EmptyTick extends SfTickShape {
  @override
  Size getPreferredSize(SfSliderThemeData themeData) {
    return Size(0, 0);
  }
}
