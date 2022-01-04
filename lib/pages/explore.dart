import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';
import 'package:real_estate/utils/data.dart';
import 'package:real_estate/widgets/broker_item.dart';
import 'package:real_estate/widgets/company_item.dart';
import 'package:real_estate/widgets/custom_textbox.dart';
import 'package:real_estate/widgets/icon_box.dart';
import 'package:real_estate/widgets/recommend_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({ Key? key }) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return 
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: appBgColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getHeader(),
          ),
          SliverToBoxAdapter(
            child: getBody()
          )
        ],
      );
  }

  getHeader(){
    return
      Row(
        children: [
          Expanded(
            child: CustomTextBox(hint: "Search", prefix: Icon(Icons.search, color: Colors.grey), )
          ),
          SizedBox(width: 10,),
          IconBox(child: Icon(Icons.filter_list_rounded, color: Colors.white), bgColor: secondary, radius: 10,)
        ],
      );
  }

   getBody(){
    return
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text("Matched Properties", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 20,),
            listRecommended(),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text("Companies", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 20,),
            listCompanies(),
            SizedBox(height: 20,),
            listBrokers(),
            SizedBox(height: 100,),
          ]
        )
      );
   }
   
  listRecommended(){
    List<Widget> lists = List.generate(recommended.length, 
      (index) => RecommendItem(data: recommended[index])
    );
    
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Row(
          children: lists
        ),
      );
  }

  int selectedCategory = 0;
  listCompanies(){
    List<Widget> lists = List.generate(companies.length, 
      (index) => CompanyItem(
        data: companies[index], color: listColors[index % 10],
        selected: index == selectedCategory,
        onTap: (){
          setState(() {
            selectedCategory =  index;
          });
        },
      )
    );
    
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Row(
          children: lists
        ),
      );
  }

  listBrokers(){
    List<Widget> lists = List.generate(brokers.length, 
      (index) => BrokerItem(data: brokers[index])
    );
    
    return
      Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: lists
        ),
      );
  }
}