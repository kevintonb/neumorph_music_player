import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neumorphmusicplayer/sizeconfig.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Responsive().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Music Player',
          home: SongScreen(),
        );
      });
    });
  }
}

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  double _lowerValue = 100.0;
  double _upperValue;
  bool isPlaying = false;
  IconData faIcon = FontAwesomeIcons.play;
  double firstOffset = 5.0;
  double secondOffset = -5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0XFF2e2e2e),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
//        decoration: BoxDecoration(
//          gradient: LinearGradient(
//            begin: Alignment.topCenter,
//            colors: [Color(0XFF24242c), Color(0XFF2e2e2e)],
//          ),
//        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 5 * Responsive.heightMultiplier,
                  horizontal: 6 * Responsive.widthMultiplier),
              child: Row(
                children: <Widget>[
                  _neuButton(Icons.arrow_back),
                  Spacer(),
                  Text(
                    "PLAYING NOW",
                    style: TextStyle(
                      color: Colors.white38,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  _neuButton(Icons.menu),
                ],
              ),
            ),
            SizedBox(
              height: 0.5 * Responsive.heightMultiplier,
            ),
            Container(
              height: 80 * Responsive.imageSizeMultiplier,
              width: 80 * Responsive.imageSizeMultiplier,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFF212121),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0XFF1c1c1c),
                    offset: Offset(15.0, 15.0),
                    blurRadius: 22.0,
                  ),
                  new BoxShadow(
                    color: Color(0XFF404040),
                    offset: Offset(-15.0, -15.0),
                    blurRadius: 22.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage("assets/images/em.jpg")),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4 * Responsive.heightMultiplier,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Crack a Bottle ",
                    style: TextStyle(
                      fontSize: 3.6 * Responsive.textMultiplier,
                      color: Colors.white70,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  WidgetSpan(
                      child: Container(
                    margin: EdgeInsets.only(
                        bottom: 1.3 * Responsive.heightMultiplier),
                    child: Icon(
                      Icons.explicit,
                      color: Colors.white54,
                      size: 4.6 * Responsive.imageSizeMultiplier,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 1.5 * Responsive.heightMultiplier,
            ),
            Text(
              "Eminem, Dr. Dre & 50 Cent",
              style: TextStyle(
                fontSize: 1.6 * Responsive.textMultiplier,
                color: Colors.white54,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 2 * Responsive.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 3 * Responsive.widthMultiplier),
              child: Row(
                children: <Widget>[
                  Text(
                    (_lowerValue / 60).toStringAsFixed(0) +
                        ":" +
                        (_lowerValue % 60).toStringAsFixed(0),
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "4:57",
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            FlutterSlider(
              values: [_lowerValue, _upperValue],
              max: 297,
              min: 0,
              tooltip: FlutterSliderTooltip(
                  textStyle: TextStyle(fontSize: 13, color: Colors.transparent),
                  boxStyle: FlutterSliderTooltipBox(
                      decoration: BoxDecoration(color: Colors.transparent))),
              trackBar: FlutterSliderTrackBar(
                inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                  border: Border.all(width: 10, color: Colors.black87),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0XFF171717),
                      offset: Offset(-3.0, -3.0),
                      blurRadius: 3.0,
                    ),
                    new BoxShadow(
                      color: Color(0XFF404040),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 0.5,
                    ),
                  ],
                ),
                activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0XFF171717),
                      offset: Offset(-3.0, -3.0),
                      blurRadius: 3.0,
                    ),
                    new BoxShadow(
                      color: Color(0XFF404040),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                    ),
                  ],
                  gradient: LinearGradient(colors: [Colors.red, Colors.amber]),
                ),
              ),
              handler: FlutterSliderHandler(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF1c1c1c),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFF212121),
                      boxShadow: [
                        new BoxShadow(
                          color: Color(0XFF1c1c1c),
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                        ),
                        new BoxShadow(
                          color: Color(0XFF404040),
                          offset: Offset(-3.0, -3.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Container(
//                      height: 1 * Responsive.heightMultiplier,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                        boxShadow: [
                          new BoxShadow(
                            color: Color(0XFF1c1c1c),
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                          ),
                          new BoxShadow(
                            color: Color(0XFF404040),
                            offset: Offset(-5.0, -5.0),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                setState(() {
                  _lowerValue = lowerValue;
                  _upperValue = upperValue;
                });
              },
            ),
            SizedBox(
              height: 2 * Responsive.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12 * Responsive.widthMultiplier),
              child: Row(
                children: <Widget>[
                  _neuControls(FontAwesomeIcons.backward),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        if (isPlaying == true) {
                          setState(() {
                            faIcon = FontAwesomeIcons.play;
                            isPlaying = !isPlaying;
                            firstOffset = -5.0;
                            secondOffset = -5.0;
                          });
                        } else if (isPlaying == false) {
                          setState(() {
                            faIcon = FontAwesomeIcons.pause;
                            isPlaying = !isPlaying;
                            firstOffset = 5.0;
                            secondOffset = 5.0;
                          });
                        }
                      },
                      child: _neuPausePlay(faIcon)),
                  Spacer(),
                  _neuControls(FontAwesomeIcons.forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _neuButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0XFF2e2e2e),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0XFF1c1c1c), Color(0XFF383838)],
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0XFF1c1c1c),
              offset: Offset(5.0, 5.0),
//                          spreadRadius: -5.0,
              blurRadius: 10.0,
            ),
            new BoxShadow(
              color: Color(0XFF404040),
              offset: Offset(-5.0, -5.0),
//                          spreadRadius: -5.0,
              blurRadius: 10.0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0XFF303030), Color(0XFF1a1a1a)]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              icon,
              size: 5.4 * Responsive.imageSizeMultiplier,
              color: Colors.white38,
            ),
          ),
        ),
      ),
    );
  }

  Widget _neuControls(IconData faIcon) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0XFF2e2e2e),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0XFF1c1c1c), Color(0XFF383838)],
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0XFF1c1c1c),
              offset: Offset(5.0, 5.0),
//                          spreadRadius: -5.0,
              blurRadius: 10.0,
            ),
            new BoxShadow(
              color: Color(0XFF404040),
              offset: Offset(-5.0, -5.0),
//                          spreadRadius: -5.0,
              blurRadius: 10.0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0XFF303030), Color(0XFF1a1a1a)]),
          ),
          child: Padding(
            padding: EdgeInsets.all(8 * Responsive.imageSizeMultiplier),
            child: FaIcon(
              faIcon,
              color: Colors.white54,
              size: 3.6 * Responsive.imageSizeMultiplier,
            ),
          ),
        ),
      ),
    );
  }

  Widget _neuPausePlay(IconData faIcon) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0XFF2e2e2e),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0XFF1c1c1c), Color(0XFF383838)],
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0XFF4a4a4a),
              offset: Offset(firstOffset, firstOffset),
              blurRadius: 6.0,
            ),
            new BoxShadow(
              color: Color(0XFF404040),
              offset: Offset(secondOffset, secondOffset),
              blurRadius: 6.0,
            ),
          ]),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red[700],
            width: 1.0,
          ),
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Colors.red[900],Colors.deepOrange[700]]),
        ),
        child: Padding(
          padding: EdgeInsets.all(9.6 * Responsive.imageSizeMultiplier),
          child: FaIcon(
            faIcon,
            color: Colors.white70,
            size: 3.6 * Responsive.imageSizeMultiplier,
          ),
        ),
      ),
    );
  }
}
