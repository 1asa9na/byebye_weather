import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key});

  @override
  Widget build(BuildContext context) => Container(
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
        child: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            "Omsk",
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
        ),
      );
}
