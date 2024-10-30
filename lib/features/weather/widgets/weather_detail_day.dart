import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayWeatherDetail extends StatelessWidget {
  const DayWeatherDetail({super.key, required this.isTemp, required this.imagePath, required this.value, required this.title});

  final bool isTemp;
  final String title;
  final String imagePath;
  final dynamic value;

  String buildText() {
    return isTemp ? "$value °C" : DateFormat().add_jm().format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 3),
            Text(
              buildText(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        )
      ],
    );
  }
}
