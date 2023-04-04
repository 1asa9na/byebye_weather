import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyForecastListWidget extends StatelessWidget {
  const DailyForecastListWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50 * 14,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 14,
            itemBuilder: (context, index) => SizedBox(
              height: 50,
              child: Row(
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
                        '3м/c',
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
                        'assets/icons/snowraincloud.png',
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
                          "ПТ",
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            color: const Color(0xFF577CAE),
                          ),
                        ),
                        Text(
                          "31.03",
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
                            width: 80 + 40 * (index + 1) / 14,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(5)),
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
                                      '20°',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    '25°',
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
                                  '22mm',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 9,
                                    color: const Color(0xFF577CAE),
                                  ),
                                ),
                                Text(
                                  '1014hPa',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 9,
                                    color: const Color(0xFF577CAE),
                                  ),
                                ),
                                Text(
                                  '80%',
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
          ),
        ),
      );
}
