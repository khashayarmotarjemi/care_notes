import 'package:care_notes/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OnboardingCardArea extends StatelessWidget {
  const OnboardingCardArea(
      {Key? key, required this.texts, required this.mainArea})
      : super(key: key);
  final List<TextSpan> texts;
  final Widget mainArea;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 28),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 21.0, height: 1.3, color: Colors.grey[600]),
                children: texts,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [mainArea],
            ))
          ],
        ),
      ),
    );
  }
}

class OutlineArea extends StatelessWidget {
  const OutlineArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        OutlineButton(color: Colors.pinkAccent, text: "COGNITIVE ASSESSMENT"),
        OutlineButton(
            color: Colors.lightBlueAccent, text: "FUNCTIONAL ASSESSMENT"),
        OutlineButton(color: Color(0xff79c9c7), text: "EMOTIONAL ASSESSMENT"),
        OutlineButton(
            color: Constants.dark_purple, text: "CAREGIVER ASSESSMENT")
      ],
    );
  }
}

class OutlineButton extends StatelessWidget {
  const OutlineButton({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}

class DateRangeArea extends StatefulWidget {
  const DateRangeArea({Key? key}) : super(key: key);

  @override
  State<DateRangeArea> createState() => _DateRangeAreaState();
}

class _DateRangeAreaState extends State<DateRangeArea> {
  final DateRangePickerController _datePickerController =
      DateRangePickerController();

  @override
  initState() {
    // _datePickerController.selectedRange = PickerDateRange(
    //     DateTime.now().subtract(const Duration(days: 14)), DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      view: DateRangePickerView.month,
      // todayHighlightColor: Colors.green,
      headerHeight: 0,
      rangeSelectionColor: Constants.light_green,
      startRangeSelectionColor: Constants.light_green,
      endRangeSelectionColor: Constants.green,
      cellBuilder: (context, r) {
        DateTime rangeStart = DateTime.now().subtract(const Duration(days: 14));
        bool isRangeStart = r.date.day == rangeStart.day + 1 &&
            r.date.month == rangeStart.month;
        bool isToday = r.date.day == DateTime.now().day &&
            r.date.month == DateTime.now().month;
        bool isInRange =
            r.date.isBefore(DateTime.now()) && r.date.isAfter(rangeStart);
        bool isSun = r.date.weekday == 7;
        bool isSat = r.date.weekday == 6;
        if (isRangeStart) {
          print("well");
        }

        final double fontSize = 13;
        DateFormat formatter =
            DateFormat('MMM'); // create a formatter to get months 3 character

        String monthAbbr = formatter.format(DateTime.now());

        if (isToday) {
          return Stack(
            children: [
              Container(
                color: Constants.light_green,
                margin: const EdgeInsets.only(top: 6, bottom: 6, right: 10),
              ),
              Card(
                color: Constants.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 2),
                      child: Text(
                        monthAbbr.toUpperCase(),
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      ),
                    )),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          r.date.day.toString(),
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSize),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ],
          );
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: isRangeStart || isSun
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))
                  : isSat
                      ? const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))
                      : null,
              color: isToday
                  ? Constants.green
                  : isInRange
                      ? Constants.light_green
                      : Colors.white),
          child: Text(
            r.date.day.toString(),
            style: TextStyle(fontSize: fontSize),
          ),
        );
      },
      controller: _datePickerController,
      selectionMode: DateRangePickerSelectionMode.range,
    );
  }
}

class ResultsArea extends StatelessWidget {
  const ResultsArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
