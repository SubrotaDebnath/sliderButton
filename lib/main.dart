import 'package:flutter/material.dart';
import 'package:slider/rectangleThumbShape.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var value = 0.0;
  var toggleText = '';
  static const cardCornerRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(cardCornerRadius), // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF42aaf5).withOpacity(value),
                border: Border.all(
                  color: Colors.grey.shade500,
                ),
                borderRadius: BorderRadius.circular(cardCornerRadius),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    value.round() == 0 ? 'Write' : 'Share',
                    style: TextStyle(
                      color: value.round() == 0
                          ? Colors.grey.shade600
                          : Colors.grey.shade100,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 0.0,
                        trackShape: RectangularSliderTrackShape(),
                        // inactiveTrackColor: Color(0xFF42aaf5).withOpacity(value),
                        // activeTrackColor: Color(0xFF42aaf5).withOpacity(value),
                        inactiveTrackColor: Color(0xFFFFFFFF).withOpacity(0),
                        activeTrackColor: Color(0xFFFFFFFF).withOpacity(0),
                        thumbColor: Colors.grey.shade500,
                        overlayShape: RectangleThumbShape(
                            8.0, 40.0, Colors.grey.shade500),

                        //thumbShape: RoundSliderThumbShape(pressedElevation: 0.0),
                        thumbShape: RectangleThumbShape(
                            8.0, 40.0, Colors.grey.shade600),
                      ),
                      child: Slider(
                        value: value,
                        min: 0,
                        max: 1,
                        onChanged: (double newValue) {
                          setState(() {
                            value = newValue;
                            print(value.round());
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
