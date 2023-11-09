import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormattedDateText extends StatelessWidget {
  final String dateData;
  final double width;
  final bool isLeftAligned;
  const FormattedDateText(
      {required this.dateData,
      required this.width,
      this.isLeftAligned = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: this.isLeftAligned == true
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Text(
        DateFormat('MMMM dd,yyyy').format(
          DateTime.parse(
            dateData,
          ),
        ),
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        textAlign: TextAlign.left,
      ),
    );
  }
}
