import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_news/screens/profile.dart';

AppBar appBar(BuildContext context,{String title  = "",Widget? leading}){
  return AppBar(title: Text(title,style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.deepPurpleAccent,
    iconTheme: IconThemeData(color: Colors.white),
    leading: leading,
);
}
Widget containerView(
    {IconData? icon, String label = "", required Function() onClick}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1), // Horizontal and vertical offset
              blurRadius: 2, // Spread of the shadow
              spreadRadius: 3, // Expands the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    //AssetType.visitingCardIcon,
                    color: Colors.deepPurpleAccent,
                    size: 30,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.deepPurpleAccent, size: 30)
            ],
          ),
        ),
      ),
    ),
  );
}