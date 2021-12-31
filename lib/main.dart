import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'pages/about.dart';

//main
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

//The body
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animatable<Color> background = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.orange,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.orange,
          end: Colors.amber,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.amber,
          end: Colors.green,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.blue,
          end: Colors.purple,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.purple,
          end: Colors.pink,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.pink,
          end: Colors.red,
        ),
      ),
    ],
  );
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor:
                background.evaluate(AlwaysStoppedAnimation(_controller.value)),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 25, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Card(
                              elevation: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),//add border radius here
                                child: Image.asset('images/Sinethemba.jpeg'),//add image location here
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(
                          'Sinethemba Luthango',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 175,
                        child: Divider(
                          color: Colors.white54,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (ctx) => Profile()));
                          },
                          child: Text('About')
                      ),
                      GestureDetector(
                        onTap: _launchPhone,
                        child: Tooltip(
                                  message: 'Phone',
                                  waitDuration: Duration(milliseconds: 500),
                                  child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.blueGrey[300],
                                ),
                                Text(
                                  '+27 717659485',
                                  style: TextStyle(color: Colors.blueGrey[300]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),),
                      GestureDetector(
                        onTap: _launchURL,
                        child: Tooltip(
                                  message: 'Email',
                                  waitDuration: Duration(milliseconds: 500),
                                  child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.mail,
                                  color: Colors.blueGrey[300],
                                ),
                                Text(
                                  'luthango39@gmail.com',
                                  style: TextStyle(color: Colors.blueGrey[300]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),),
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: _launchLI,
                                child: Tooltip(
                                  message: 'LinkedIn',
                                  waitDuration: Duration(milliseconds: 500),
                                  child:Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.blueGrey[300],
                                ),),
                              ),
                              GestureDetector(
                                onTap: _launchGH,
                                child: Tooltip(
                                  message: 'Github',
                                  waitDuration: Duration(milliseconds: 500),
                                  child:Icon(
                                  FontAwesomeIcons.githubSquare,
                                  color: Colors.blueGrey[300],
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

_launchPhone() async {
  const url = 'tel:+27 717659485';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = 'mailto:luthango39@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchLI() async {
  const url = 'https://www.linkedin.com/in/sinethemba-luthango-9195175a//';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchGH() async {
  const url = 'https://github.com/sluthang';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

