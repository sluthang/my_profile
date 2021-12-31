import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'about.dart';

//About page
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("About Sinethemba Luthango"),
        ),
        body: Column(
            children:[
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("images/Profile.jpg"),
              ),

              ListTile(
                title: Center(child: Text("Sinethemba Luthango", style: TextStyle(fontSize: 20),),) ,
                subtitle: Center(child: Text("Junior Software Developer", style: TextStyle(fontSize: 15)),),
              ),
              ListTile(
                title: Text("About", style: TextStyle(fontSize: 20)),
                subtitle: Text("With 4 months of internship experience as a Junior Software Developer and two years as Software Engineer student. My interest in the field of IT started when i applied for WeThinkCode(Software Engineering Training Program) and i got accepted to be part of their 2020 cohort as a Software Engineer student. "
                               "I have developed a mobile apps using Java(Server) and SQLite(for database) for Backend, and for the Frontend i used Flutter which uses Dart (client based). I have also been working on other projects using languages"
                               " like Python and C. All the projects i have worked on can be found on my GitHub account. ", style: TextStyle(fontSize: 15)),
              )
            ],
          )
    );
  }
}