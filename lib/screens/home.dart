import 'package:flutter/material.dart';
import 'package:today_news/common_widgets.dart';
import 'package:today_news/screens/profile.dart';
import 'package:today_news/strings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,title: Strings.news,leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
          },
          child: Icon(Icons.menu))),
    );
  }
}
