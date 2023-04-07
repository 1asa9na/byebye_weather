import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labtask/bloc/dailyforecastbloc.dart';

import '../models/weathercodemap.dart';

class DailyForecastItem extends StatelessWidget {
  final int index;
  final int sumOfTs;
  const DailyForecastItem(this.index, this.sumOfTs, {super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DailyForecastBloc>(context);
    return SizedBox(
      height: 50,
      child: BlocBuilder<DailyForecastBloc, DFState>(
        builder: (BuildContext context, DFState state) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 12,
                ),
                child: Image.asset(
                  'assets/icons/wind.png',
                ),
              ),
            ),
            SizedBox(
              width: 45,
              child: Center(
                child: Text(
                  '${state.windSpeed}м/c',
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: const Color(0xFF577CAE),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 32,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 12,
                ),
                child: Image.asset(
                  'assets/icons/${state.forecastImage}.png',
                ),
              ),
            ),
            SizedBox(
              width: 32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${WeatherCodeMap.daysOfWeek[state.date.weekday]}",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: const Color(0xFF577CAE),
                    ),
                  ),
                  Text(
                    "${state.date.day}.${state.date.month}",
                    style: GoogleFonts.montserrat(
                      fontSize: 9,
                      color: const Color(0xFF577CAE),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 170,
              child: Row(
                children: [
                  Container(
                      height: 35,
                      width: 80 + 40 * (state.temperatureMax.round()) / sumOfTs,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(5)),
                        color: Color(0xFF7CB1F8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 40,
                            color: const Color(0xFF577CAE),
                            child: Center(
                              child: Text(
                                '${state.temperatureMin.round()}°',
                                style: GoogleFonts.montserrat(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              '${state.temperatureMax.round()}°',
                              style: GoogleFonts.montserrat(
                                  fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '🌧️ ${state.probability}%\t',
                            style: GoogleFonts.montserrat(
                              fontSize: 9,
                              color: const Color(0xFF577CAE),
                            ),
                          ),
                          Text(
                            '🗜️ ${state.pressure}hPa',
                            style: GoogleFonts.montserrat(
                              fontSize: 9,
                              color: const Color(0xFF577CAE),
                            ),
                          ),
                          Text(
                            '💧 ${state.humidity}%',
                            style: GoogleFonts.montserrat(
                              fontSize: 9,
                              color: const Color(0xFF577CAE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
