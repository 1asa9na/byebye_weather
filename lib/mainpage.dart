import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 52, 149, 227),
              foregroundColor: Colors.white,
              pinned: true,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Omsk",
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.width * (9 / 16),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: Color.fromARGB(100, 0, 0, 0),
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder: (context, index) => SizedBox(
                        width: 70,
                        height: 210,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Color.fromARGB(255, index * 10, 0, 0),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Color.fromARGB(255, 0, index * 10, 0),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Color.fromARGB(255, 0, 0, index * 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: Color.fromARGB(100, 0, 0, 0),
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60 * 14,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 14,
                        itemBuilder: (context, index) => SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Text("amogis"),
                              Spacer(),
                              Text("$index"),
                              Spacer(),
                              SizedBox(
                                width: 60,
                                child: Container(
                                  color: Color.fromARGB(255, index * 10,
                                      (index * 20) % 256, (index * 30) % 256),
                                ),
                              ),
                            ],
                          ),
                        ),
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
