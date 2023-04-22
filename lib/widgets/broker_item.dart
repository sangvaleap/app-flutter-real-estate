import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';
import 'custom_image.dart';

class BrokerItem extends StatelessWidget {
  const BrokerItem({Key? key, required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfile(),
          const SizedBox(
            height: 10,
          ),
          Text(
            data["description"],
            style: TextStyle(height: 1.5, color: AppColor.darker),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildRate()
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Row(
      children: [
        CustomImage(
          data["image"],
          width: 35,
          height: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data["name"],
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              data["type"],
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildRate() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: AppColor.yellow,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: AppColor.yellow,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: AppColor.yellow,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: AppColor.yellow,
        ),
        Icon(
          Icons.star_outline,
          size: 16,
          color: AppColor.yellow,
        ),
      ],
    );
  }
}
