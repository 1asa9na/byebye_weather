import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Произошла ошибка. Невозможно определить местоположение.",
                style: GoogleFonts.montserrat(fontSize: 24)),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                "Открыть настройки",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
            ),
          ],
        ),
      );
}
