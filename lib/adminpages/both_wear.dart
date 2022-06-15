import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/component/myclass.dart';

class BothWears extends StatefulWidget {
  const BothWears({Key? key}) : super(key: key);

  @override
  State<BothWears> createState() => _BothWearsState();
}

class _BothWearsState extends State<BothWears> {
  final Stream<QuerySnapshot> _bothtList =
      FirebaseFirestore.instance.collection('Both').snapshots();
  Settings mm = FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _bothtList,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Card(
              elevation: 20.0,
              color: Colors.white,
              surfaceTintColor: Colors.yellow,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: data['ImageUrl'].toString(),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Row(
                            children: const [
                              Icon(Icons.error,color: Colors.red),
                              Text('Check your internet connection')
                            ],
                          ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Badge(
                      badgeColor: Colors.red,
                      child: Icon(
                        Icons.star,
                        size: 50.0,
                        color: Colors.amber,
                      ),
                      position: BadgePosition.topEnd(top: 10, end: 30),
                      badgeContent: Text(
                        data['discription'],
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: myColor,
                            fontWeight: FontWeight.bold),
                      ),
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
