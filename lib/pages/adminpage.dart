import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/adminpages/customers_request_view.dart';
import 'package:studentbee/adminpages/load_items_to_gents.dart';
import 'package:studentbee/adminpages/load_measurement.dart';
import 'package:studentbee/adminpages/register_first_years.dart';
import 'package:studentbee/adminpages/student_admin_List.dart';
import 'package:studentbee/component/horinzontal_scrow.dart';
import 'package:studentbee/component/myclass.dart';
import 'package:studentbee/pages/homepage.dart';
import 'package:studentbee/pages/measurement_list.dart';
import 'package:studentbee/pages/trypkor.dart';

class AdminstratiomPage extends StatefulWidget {
  const AdminstratiomPage({Key? key}) : super(key: key);

  @override
  State<AdminstratiomPage> createState() => _AdminstratiomPageState();
}

class _AdminstratiomPageState extends State<AdminstratiomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading:  IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
            }, icon: Icon(Icons.home,size: 50,),


          ),
          backgroundColor:myColor,
          shadowColor: Colors.white,
          title: Center(child: Text('ADMIN ONLY',
          style: TextStyle(
            color: Colors.white
          ),)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.pinkAccent,
                    Colors.purple,
                    Colors.orange,

                  ])
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadApprentDatail()));

                      },
                      child: Card(
                        shadowColor: Colors.red,
                        elevation: 7,
                        child: Center(child: Text("REGISTER \n\ Apprentice",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadNRecieveNews()));
                      },
                      child: Card(
                        shadowColor: Colors.red,
                        elevation: 7,
                        child: Center(child: Text(" LOAD \n\ IMAGES",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMeasurements()));
                      },
                      child: Card(
                        shadowColor: Colors.red,
                        elevation: 7,
                        child: Center(child: Text("Customers \n\ Measure",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Customers_Request_views()));
                      },
                      child: Card(
                        shadowColor: Colors.red,
                        elevation: 7,
                        child: Center(child: Text(" VIEW \n\ Request",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MeasurementList ()));
                      },
                      child: Card(
                        shadowColor: Colors.red,
                        elevation: 7,
                        child: Center(child: Text("MEASUREMENT \n\      List",style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 12.0
                        ),)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudientAdminList()));
                      },
                      child: Card(
                        shadowColor: Colors.red,
                        elevation: 7,
                        child: Center(child: Text(" APPRENTICE \n\ List ",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),)),
                      ),
                    ),

                  ],
                ),
              )),
        ));
  }
}
