import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labtask/pages/forecastpage.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://www.tomorrow.io'))) {
      throw Exception('Could not launch');
    }
  }

  WelcomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email_sharp),
                      label: Text(
                        "API Токен Tomorrow.io",
                        style: GoogleFonts.roboto(),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller,
                    validator: (value) {
                      RegExp regExp = RegExp(r"[0-9a-zA-Z/+]{32}");
                      if (value == null || value.isEmpty) {
                        return 'Введите ключ';
                      } else {
                        if (!regExp.hasMatch(value)) {
                          return 'Введите верный ключ';
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Обработка данных')),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForecastPage(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Подтвердить",
                          style: GoogleFonts.openSans(fontSize: 18),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: _launchUrl,
                        child: Text(
                          "Получить",
                          style: GoogleFonts.openSans(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
