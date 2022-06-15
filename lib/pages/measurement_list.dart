import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/component/myclass.dart';
import 'package:url_launcher/url_launcher.dart';

class MeasurementList extends StatefulWidget {
  const MeasurementList({Key? key}) : super(key: key);

  @override
  State<MeasurementList> createState() => _MeasurementListState();
}

class _MeasurementListState extends State<MeasurementList> {
 CollectionReference ReFF= FirebaseFirestore.instance.collection('Measurement');

    Future<void>DeleteMeasurement(String productId)async{
      ReFF.doc(productId).delete();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: ReFF.snapshots(),
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
                child: ListTile(
                  subtitle: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Text(
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                              'Name: ' + data['Name'],
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ),

                           Align(

                            alignment: AlignmentDirectional.bottomStart,
                            child: Text(

                               'Phone Number: \n\ ' + data['PhoneNO:'],
                              style: TextStyle(color: Colors.black),
                             ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Text(
                              'Style num or name:  \n\  ' + data['Style'],
                              style: TextStyle(color: Colors.black),
                            ),
                           ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Text(
                              'Measurement:  \n\ ' + data['Measurement'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Text(
                              'Date:  \n\  ' + data['Date'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      )
                  ),
                  trailing: IconButton(
                    onPressed:(){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(6, 7)),
                              ),
                              title: Center(
                                  child: Text('Are you sure you want to delete this file??',style:
                                    TextStyle(fontSize: 12),)),
                              children: [

                                ListTile(
                                    trailing: ElevatedButton(
                                      onPressed: () {
                                        DeleteMeasurement(document.id);

                                        showShortToast(
                                            'Deleted !');
                                        Navigator.pop(context);

                                        //Navigator.of(context);
                                      },
                                      child: Text('Delete'),
                                    ),
                                    leading: TextButton(
                                      onPressed: () {
                                        // Navigator.of(context);

                                        Navigator.maybePop(context);
                                      },
                                      child: Text(
                                        'EXIT',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15),
                                      ),
                                    ))
                              ],
                            );
                          });

                    },
                    icon: Icon(Icons.delete_forever,color: Colors.red,size: 40.0,),),

                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }


} //"Name": FullName.text,
