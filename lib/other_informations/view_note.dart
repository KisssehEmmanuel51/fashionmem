 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Measurement').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  
                  subtitle: Text(data['myNote'],style: TextStyle(color: Colors.black),),
                  title: Text(data['dat'],style: TextStyle(color: Colors.red,fontSize: 12,),),

                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}