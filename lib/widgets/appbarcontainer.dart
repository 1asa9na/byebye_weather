import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labtask/widgets/nowforecastbuilder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/hourlyforecastbloc.dart';

class AppBarContainer extends StatelessWidget {
  final SharedPreferences prefs;
  const AppBarContainer(this.prefs, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 124, 177, 248),
            Color.fromARGB(255, 52, 149, 227),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FlexibleSpaceBar(
          background: BlocProvider<HourlyForecastBloc>(
            create: (BuildContext context) =>
                HourlyForecastBloc()..add(HFEvent(0, prefs)),
            child: NowForecastBuilder(),
          ),
          centerTitle: true,
          title: Text(
            prefs.getString('district') ?? 'Неизвестно',
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
