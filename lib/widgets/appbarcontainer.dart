import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          background: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/main_icons/sun.png'),
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
                            '17°',
                            style: GoogleFonts.montserrat(
                                fontSize: 40, color: Colors.white),
                          ),
                          Text(
                            'Облачно',
                            style: GoogleFonts.montserrat(
                                fontSize: 20, color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
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
