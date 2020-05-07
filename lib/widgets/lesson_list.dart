import 'package:expandable/expandable.dart';
import 'package:flight_training/widgets/decorated_Table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: const ExpandableThemeData(iconColor: Colors.blue, useInkWell: true),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Card1(),
          Card2(),
          Card3(),
          Card4(),
        ],
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Container(
                child: Center(
                  child: Text(
                    "Lesson 0 - Familiarization flight",
                    style: GoogleFonts.juliusSansOne(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card2 extends StatelessWidget {
  final YoutubePlayerController _controllerUnderstandingcontrols =
      YoutubePlayerController(
    initialVideoId: '5E4L7_-boZA',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerCoordinatedcontrol =
      YoutubePlayerController(
    initialVideoId: 'IkXfseVWedA',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerUseofflaps = YoutubePlayerController(
    initialVideoId: 'CD5ZdKrYH9M',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Container(
                child: Center(
                  child: Text(
                    "Lesson 1 - Effects of control",
                    style: GoogleFonts.juliusSansOne(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "",
                  ),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Video Sessions"),
                        GestureDetector(
                            child: Text(
                              "  (View More ...)",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () async {
                              const url =
                                  'https://www.youtube.com/results?search_query=Effects+of+control';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.7,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller:
                                        _controllerUnderstandingcontrols,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Understanding controls",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerCoordinatedcontrol,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Coordinated Control",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerUseofflaps,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Use of flaps",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card3 extends StatelessWidget {
  final YoutubePlayerController _controllerStraightandlevel1 =
      YoutubePlayerController(
    initialVideoId: '8EEuOlbAYMQ',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerStraightandlevel2 =
      YoutubePlayerController(
    initialVideoId: 'WgjCuU445YA',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerStraightandlevel3 =
      YoutubePlayerController(
    initialVideoId: '4Tkf2s2surc',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerSlowflight = YoutubePlayerController(
    initialVideoId: 'mx6DSNTM_qc',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final List<String> titleCol = [
    "Normal Cruise",
    "Fast",
    "Slow",
    "Slow with Flaps",
  ];

  final List<String> titleRow = [
    "Power Setting",
    "Attitude",
    "Speed",
    "Trim",
  ];

  final List<List<String>> data = [
    [
      "2350 rpm",
      "⅓ Ground,⅔ Sky",
      "95 kts",
      "As Required",
    ],
    [
      "2500 rpm",
      "½ Ground,½ Sky",
      "105 kts",
      "As Required",
    ],
    [
      "2100 rpm",
      "Nose on the Horizon",
      "80 kts",
      "As Required",
    ],
    [
      "2100 rpm",
      "⅓ Ground,⅔ Sky",
      "75 kts",
      "As Required",
    ]
  ];

  final String titile = "Types of straight and level flights (C152)";

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Container(
                child: Center(
                  child: Text(
                    "Lesson 2 - Straight and level",
                    style: GoogleFonts.juliusSansOne(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "",
                  ),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Video Sessions"),
                        GestureDetector(
                            child: Text(
                              "  (View More ...)",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () async {
                              const url =
                                  'https://www.youtube.com/results?search_query=Straight+and+level';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.7,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerStraightandlevel1,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Straight and level P1",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerStraightandlevel2,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Straight and level P2",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerStraightandlevel3,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Straight and level P3",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerSlowflight,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Slow flight",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: TableDecorated(
                        data: this.data,
                        titleColumn: this.titleCol,
                        titleRow: this.titleRow,
                        titile: titile,
                      ),
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card4 extends StatelessWidget {
  final YoutubePlayerController _controllerStraightandlevel1 =
      YoutubePlayerController(
    initialVideoId: 'oZzTbJsl7_Q',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerStraightandlevel2 =
      YoutubePlayerController(
    initialVideoId: 'VQ_0iJ6uUB0',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerStraightandlevel3 =
      YoutubePlayerController(
    initialVideoId: '4Tkf2s2surc',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final YoutubePlayerController _controllerSlowflight = YoutubePlayerController(
    initialVideoId: 'mx6DSNTM_qc',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final List<String> titleRow = [
    "Best Angle of Climb",
    "Best Rate of Climb",
    "Cruise Climb",
  ];

  final List<String> titleCol = [
    "Power",
    "Attitude",
    "Speed",
  ];

  final List<List<String>> data = [
    [
      "FULL",
      "Horizon through the lower instrument panel",
      "Vx - 55 kts",
      "As Required",
    ],
    [
      "FULL",
      "Horizon through the upper instrument panel",
      "Vx - 55 kts",
      "As Required",
    ],
    [
      "FULL",
      "Nose on the horizon",
      "Vx - 55 kts",
      "As Required",
    ],
  ];

  final String titile = "Types of climbs (C152)";

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Container(
                child: Center(
                  child: Text(
                    "Lesson 3 - Climbing",
                    style: GoogleFonts.juliusSansOne(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "",
                  ),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                         Row(
                      children: <Widget>[
                        Text("Video Sessions"),
                        GestureDetector(
                            child: Text(
                              "  (View More ...)",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () async {
                              const url =
                                  'https://www.youtube.com/results?search_query=flight+climbing';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.7,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerStraightandlevel1,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Climbing  P1",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  YoutubePlayer(
                                    controller: _controllerStraightandlevel2,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text(
                                    "Climbing P2",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: TableDecorated(
                        data: this.data,
                        titleColumn: this.titleRow,
                        titleRow: this.titleCol,
                        titile: titile,
                      ),
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
