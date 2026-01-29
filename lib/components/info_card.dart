import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Color _color;
  final Widget _cardChild;
  final Function _functionality;
  const InfoCard(this._color, this._cardChild, this._functionality, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _functionality();
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: _cardChild,
      ),
    );
  }
}