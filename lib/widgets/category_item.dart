
import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({ Key? key, required this.data, this.selected = false, this.onTap}) : super(key: key);
  final data;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        margin: EdgeInsets.only(right: 10),
        width: 90, height: 90,
        decoration: BoxDecoration(
          color: selected ? primary : cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(data["icon"], size: 25, color: selected ? Colors.white : Colors.black),
            SizedBox(height: 5,),
            Expanded(
              child: Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, 
                style: TextStyle(fontSize: 13, color: selected ? Colors.white : darker),
              ),
            ),
            // Visibility(
            //     visible: selected,
            //     child: Container(
            //       width: double.infinity, height: 2, 
            //       decoration: BoxDecoration(
            //         color: primary,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}