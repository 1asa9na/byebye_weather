import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labtask/main.dart';
import 'package:labtask/widgets/appbarcontainer.dart';
import 'package:labtask/widgets/bottomnavigationbarcontainer.dart';
import 'package:labtask/widgets/dailyforecastlistwidget.dart';
import 'package:labtask/widgets/hourlyforecastlistwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForecastPage extends StatelessWidget {
  final String apikey = FlutterConfig.get('APIKEY');
  SharedPreferences prefs;
  ForecastPage(this.prefs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await initApp(prefs);
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                foregroundColor: Colors.white,
                pinned: true,
                centerTitle: true,
                flexibleSpace: const AppBarContainer(),
                expandedHeight: MediaQuery.of(context).size.width * (9 / 16),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        color: Color.fromARGB(25, 0, 0, 0),
                        thickness: 2,
                      ),
                    ),
                    HourlyForecastListWidget(prefs),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        color: Color.fromARGB(25, 0, 0, 0),
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'На этой неделе пасмурно, средняя температура 23°, самый тёплый день воскресенье с температурой 28°',
                        style: GoogleFonts.montserrat(
                            fontSize: 18, color: const Color(0xFF577CAE)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        color: Color.fromARGB(25, 0, 0, 0),
                        thickness: 2,
                      ),
                    ),
                    DailyForecastListWidget(prefs),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          color: Color(0xFFFAFAFA),
          elevation: 0,
          notchMargin: 0,
          child: BottomNavigationBarContainer(),
        ),
      );
}
