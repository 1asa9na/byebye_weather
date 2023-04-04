import 'package:flutter/material.dart';

class BottomNavigationBarContainer extends StatelessWidget {
  const BottomNavigationBarContainer({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 57,
        child: Column(
          children: [
            const Divider(height: 1, color: Color(0xFFBDC5CD)),
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      color: Color(0xFFD9D9D9),
                      icon: Icon(
                        Icons.sunny,
                        size: 32,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      color: Color(0xFFD9D9D9),
                      icon: Icon(
                        Icons.my_location_sharp,
                        size: 32,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      color: Color(0xFFD9D9D9),
                      icon: Icon(
                        Icons.settings_sharp,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
