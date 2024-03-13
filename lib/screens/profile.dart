import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:today_news/common_widgets.dart';
import 'package:today_news/screens/login.dart';
import 'package:today_news/strings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,title: Strings.profile,leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back))),
      body: SafeArea(
        child: Column(
          children: [

            Center(child: Image.asset("assets/img_person.jpg",height: 100,width: 100,)),
            SizedBox(height: 10,),
            Text(FirebaseAuth.instance.currentUser!.email ?? ""),
            SizedBox(height: 30,),
            containerView(icon: Icons.align_vertical_bottom_outlined,label: "About App",onClick: (){}),
            containerView(icon: Icons.share,label: "Share App",onClick: (){
              Share.share('check out my website https://example.com');

            }),
            containerView(icon: Icons.logout,label: "LogOut",onClick: () async {
           FirebaseAuth.instance.signOut();
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);
            }),

          ],
        ),
      ),
    );
  }
}
