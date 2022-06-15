import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Customers_Request_views extends StatefulWidget {
  const Customers_Request_views({Key? key}) : super(key: key);

  @override
  State<Customers_Request_views> createState() => _Customers_Request_viewsState();
}

class _Customers_Request_viewsState extends State<Customers_Request_views> {
  bool isImageLoading =true;
  final Stream<QuerySnapshot>_gentList = FirebaseFirestore.instance.collection("Request").snapshots();
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: _gentList,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 5.0,
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Card(
              elevation:20.0,
              color:Colors.white,
              surfaceTintColor: Colors.yellow,
              child: Column(

                children: [

                  Align(
                    alignment: Alignment.topRight,
                    child: Badge(
                      badgeColor: Colors.purpleAccent,
                      child: Icon(Icons.star,size: 50.0,color: Colors.amber,),
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      badgeContent: Text(data['discription']),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child:CachedNetworkImage(
                      imageUrl:  data['ImageUrl'].toString(),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),

                  ),



                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
