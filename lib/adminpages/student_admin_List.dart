import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/component/myclass.dart';
import 'package:url_launcher/url_launcher.dart';

class StudientAdminList extends StatefulWidget {
  const StudientAdminList({Key? key}) : super(key: key);

  @override
  State<StudientAdminList> createState() => _StudientAdminListState();
}

class _StudientAdminListState extends State<StudientAdminList> {
  CollectionReference myApprenREff =
      FirebaseFirestore.instance.collection('RegistionNew');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: myApprenREff.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return //showMyDialog();
                Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CirclarProg(context);
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                  elevation: 3.0,
                  shadowColor: Colors.blue,
                  child: Expanded(
                    child: Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            height: 100,
                            width: 100,
                            imageUrl: data['ImageUrl'].toString(),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'NAME :' + data['FullName'],
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Date Of Birth  :' + data["DoB"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),

                            Text(
                              'Level of edu: ' + data['Course'],
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Marital Status: ' + data['Residence'],
                              style: TextStyle(color: Colors.black),
                            ),Text(
                                 'GuidName: ' + data['GuidaneName'],
                                 style: TextStyle(color: Colors.black),
                               ),
                            Text(
                              'Guidian No: ' + data['GuidanceNo'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),

              Expanded(
                child: Column(
                  children: [
                    Text(
                    'Date of Admission :\n\ ' + data['DateOfReg'],
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                    ),),
                  ],
                ),
              )
                      ],
                    ),
                  ));
            }).toList(),
          );
        },
      ),
    );
  }
} //"Name": FullName.text,
