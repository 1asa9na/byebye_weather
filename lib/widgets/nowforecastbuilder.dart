import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/hourlyforecastbloc.dart';

class NowForecastBuilder extends StatelessWidget {
  const NowForecastBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HourlyForecastBloc>(context);
    final bool isNight = (DateTime.now().hour < 6 || DateTime.now().hour > 21);
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<HourlyForecastBloc, HFState>(
        builder: (context, state) {
          final bool isExtendable = (state.forecastMainImage == 'cloud' ||
              state.forecastMainImage == '');
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                    'assets/main_icons/${state.forecastMainImage}${isExtendable ? isNight ? 'moon' : 'sun' : ''}.png'),
              ),
              const Spacer(),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${state.temperature.round()}°',
                        style: GoogleFonts.montserrat(
                            fontSize: 40, color: Colors.white),
                      ),
                      Text(
                        '${state.forecastWord}',
                        style: GoogleFonts.montserrat(
                            fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
