import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherbloc/features/weather/widgets/weather_detail_day.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_bloc_state.dart';
import '../functions/functions.dart';
import '../widgets/background_gradient_blur.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              ...buildBackgroundGradientBlur(),
              BlocBuilder<WeatherBloc, WeatherBlocState>(builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '📍 ${state.weather.areaName}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          getGreeting(state.weather.date!),
                          style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        Center(
                          child: Text(
                            '${state.weather.temperature!.celsius!.round()}°C',
                            style: const TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Center(
                          child: Text(
                            state.weather.weatherMain!.toUpperCase(),
                            style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(
                            DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DayWeatherDetail(
                              isTemp: false,
                              imagePath: 'assets/sunrise.png',
                              title: 'Sunrise',
                              value: state.weather.sunrise!,
                            ),
                            DayWeatherDetail(
                              isTemp: false,
                              imagePath: 'assets/sunset.png',
                              title: 'Sunset',
                              value: state.weather.sunset!,
                            ),
                          ],
                        ),
                        const PaddedDivider(padding: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DayWeatherDetail(
                              isTemp: true,
                              imagePath: 'assets/tempmax.png',
                              title: 'Temp Max',
                              value: state.weather.tempMax!.celsius!.round(),
                            ),
                            DayWeatherDetail(
                              isTemp: true,
                              imagePath: 'assets/tempmin.png',
                              title: 'Temp Min',
                              value: state.weather.tempMin!.celsius!.round(),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({super.key, required this.padding});

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: const Divider(
        color: Colors.grey,
      ),
    );
  }
}
