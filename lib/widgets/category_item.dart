
import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({ Key? key, required this.data, this.seleted = false, this.onTap}) : super(key: key);
  final data;
  final bool seleted;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        margin: EdgeInsets.only(right: 10),
        width: 90,
        decoration: BoxDecoration(
          color: seleted ? primary : cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(data["icon"], size: 25, color: seleted ? primary : Colors.black),
            SizedBox(height: 5,),
            Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, 
              style: TextStyle(fontSize: 13, color: seleted ? Colors.white : darker),
            )
          ],
        ),
      ),
    );
  }
}