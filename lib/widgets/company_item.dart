import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';

class CompanyItem extends StatelessWidget {
  CompanyItem({ Key? key, required this.data, this.bgColor = Colors.white, this.color = primary, this.selected = false, this.onTap}) : super(key: key);
  final data;
  final Color bgColor;
  final Color color;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 110, height: 110,
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: .5,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(.3)
                ),
                child: Icon(data["icon"], color: color),
              ),
              SizedBox(height: 8,),
              Text(data["name"], maxLines: 1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
              SizedBox(height: 5,),
              Expanded(child: Text(data["type"], style: TextStyle(fontSize: 12, color: darker),)),
              Visibility(
                visible: selected,
                child: Container(
                  width: double.infinity, height: 2, 
                  decoration: BoxDecoration(
                    color: primary
                  ),
                ),
              ),
            ]
          ),
        ),
      );
  }
}