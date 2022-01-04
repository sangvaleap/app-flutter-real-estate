
import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon, this.title, {this.onTap, this.color = inActiveColor, this.activeColor = primary, this.isActive = false, this.isNotified = false});
  final IconData icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: 
      Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isActive ? primary.withOpacity(.1) : Colors.transparent,
              ),
              child: Icon(icon, size: 25, color: isActive ? activeColor : color)
            ),
            Positioned(
              bottom: -8,
              child: Icon(Icons.arrow_drop_up, size: 20.0, color: isActive ? activeColor: Colors.transparent)
            ),
          ]
        ),
      ),
    );  
  }
}
