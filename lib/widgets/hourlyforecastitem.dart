import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:labtask/bloc/hourlyforecastbloc.dart';

class HourlyForecastItem extends StatelessWidget {
  final int index;
  const HourlyForecastItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HourlyForecastBloc>(context);
    return SizedBox(
      width: 45,
      child: BlocBuilder<HourlyForecastBloc, HFState>(
        builder: (BuildContext context, HFState state) => Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Image.asset(
                  'assets/icons/${state.forecastImage}.png',
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Text(
                  DateFormat('Hm').format(state.date),
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: const Color(0xFF577CAE),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Text(
                  '${state.temperature}°',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: const Color(0xFF577CAE),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
