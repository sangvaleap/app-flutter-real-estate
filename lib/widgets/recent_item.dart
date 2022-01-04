import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';

import 'custom_image.dart';

class RecentItem extends StatelessWidget {
  RecentItem({ Key? key, required this.data }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 280,
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Row(
            children: [
              CustomImage(data["image"], 
                radius: 20,
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.place_outlined, size: 13,),
                        SizedBox(width: 3,),
                        Expanded(child: Text(data["location"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12,),)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(data["price"], style: TextStyle(fontSize: 13, color: primary, fontWeight: FontWeight.w500),)
                  ],
                ),
              )
            ],
          ),
        );
  }
}