import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';

import 'custom_image.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({ Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 220, height: 130,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(data["image"], radius: 20, width: double.infinity, height: double.infinity,),
            Container(
              width: double.infinity, height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.white.withOpacity(.01),
                  ]
                )
              ),
            ),
            Positioned(
              bottom: 12, left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.white, size: 13,),
                      SizedBox(width: 3,),
                      Text(data["location"], style: TextStyle(fontSize: 13, color: Colors.white,),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      );
  }
}