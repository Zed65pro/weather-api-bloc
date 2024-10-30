import 'package:flutter/material.dart';

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Image.asset('assets/thunder.png');
    case >= 300 && < 400:
      return Image.asset('assets/rain.png');
    case >= 500 && < 600:
      return Image.asset('assets/heavy_rain.png');
    case >= 600 && < 700:
      return Image.asset('assets/snow.png');
    case >= 700 && < 800:
      return Image.asset('assets/windy.png');
    case == 800:
      return Image.asset('assets/sunny.png');
    case > 800 && <= 804:
      return Image.asset('assets/normal.png');
    default:
      return Image.asset('assets/normal.png');
  }
}

String getGreeting(DateTime dateTime) {
  int hour = dateTime.hour;

  if (hour >= 5 && hour < 12) {
    return "Good Morning";
  } else if (hour >= 12 && hour < 17) {
    return "Good Afternoon";
  } else if (hour >= 17 && hour < 21) {
    return "Good Evening";
  } else {
    return "Good Night";
  }
}
