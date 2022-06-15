import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/adminpages/both_wear.dart';
import 'package:studentbee/adminpages/gent_wear.dart';
import 'package:studentbee/adminpages/kids_wear.dart';
import 'package:studentbee/adminpages/ladies_wear.dart';
import 'package:studentbee/component/myclass.dart';
import 'package:studentbee/component/myclass.dart';

class FashionHomePage extends StatefulWidget {
  const FashionHomePage({Key? key}) : super(key: key);

  @override
  State<FashionHomePage> createState() => _FashionHomePageState();
}

class _FashionHomePageState extends State<FashionHomePage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [Image(image: AssetImage('images/wflogo.png'))],
          title: Text(
            'All the styles you want',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: myColor,
          bottom: TabBar(

            labelColor: Colors.white,
            indicatorColor: Colors.yellow,
            indicatorWeight: 3.0,
            tabs: [
              Tab(
                text: 'Gent',
                icon: Icon(Icons.star, color: Colors.amber),
              ),
              Tab(
                text: 'Ladies',
                icon: Icon(Icons.star, color: Colors.amber),
              ),
              Tab(
                text: 'Kids',
                icon: Icon(Icons.star, color: Colors.amber),
              ),
              Tab(
                text: 'Both',
                icon: Icon(Icons.star, color: Colors.amber),
              ),
            ],
          ),
        ),
        body: Container(
          color: myColor,
          child: TabBarView(
            children: [
              GentWear(),
              LadiesWear(),
              KidsWear(),
              BothWears(),
            ],
          ),
        ),
      ));
}
