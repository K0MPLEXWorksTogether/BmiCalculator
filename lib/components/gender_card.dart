import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class GenderCard extends StatelessWidget {
  final IconData _iconData;
  final String _title;
  const GenderCard(this._iconData, this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(_iconData, size: 80.0),
        SizedBox(height: 15.0),
        Text(
          _title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
