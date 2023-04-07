import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labtask/widgets/hourlyforecastitem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/hourlyforecastbloc.dart';

class HourlyForecastListWidget extends StatelessWidget {
  final SharedPreferences prefs;
  const HourlyForecastListWidget(this.prefs, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 105,
        child: ListView.builder(
          primary: false,
          scrollDirection: Axis.horizontal,
          itemCount: 24,
          itemBuilder: (context, index) => BlocProvider<HourlyForecastBloc>(
              create: (BuildContext context) =>
                  HourlyForecastBloc()..add(HFEvent(index, prefs)),
              child: HourlyForecastItem(index)),
        ),
      );
}
