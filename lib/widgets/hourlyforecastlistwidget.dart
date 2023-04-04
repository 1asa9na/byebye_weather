import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/hourlyforecastbloc.dart';

class HourlyForecastListWidget extends StatelessWidget {
  const HourlyForecastListWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 105,
        child: ListView.builder(
          primary: false,
          scrollDirection: Axis.horizontal,
          itemCount: 24,
          itemBuilder: (context, index) => SizedBox(
            width: 45,
            child: BlocProvider<HourlyForecastBloc>(
              create: (BuildContext context) => HourlyForecastBloc(),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      child: Image.asset(
                        'assets/icons/windcloudsun.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                      child: Text(
                        '10:00',
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
                        '21°',
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
          ),
        ),
      );
}
