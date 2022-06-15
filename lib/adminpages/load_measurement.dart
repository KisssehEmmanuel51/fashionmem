import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/component/myclass.dart';
import 'package:intl/intl.dart';
import 'package:studentbee/pages/adminpage.dart';

FirebaseFirestore Ref = FirebaseFirestore.instance;

class AddMeasurements extends StatefulWidget {

  const AddMeasurements({Key? key}) : super(key: key);

  @override
  State<AddMeasurements> createState() => _AddMeasurementsState();
}

class _AddMeasurementsState extends State<AddMeasurements> {
  TextEditingController CustomersName = TextEditingController();
  TextEditingController CustomersTell = TextEditingController();
  TextEditingController CustomerStyleNumber = TextEditingController();
  TextEditingController CustomersMeasure = TextEditingController();
  CollectionReference myadd= FirebaseFirestore.instance.collection('Measurement');
  final _formkey = GlobalKey<FormState>();



  today(){
   return DateFormat('yyyy-MM-dd-kk-mm').format(DateTime.now()).toString();
    //DateFormat.yMEd().add_jms().format(DateTime.now());
  }

  addUser()async{
    try{
      myadd.add({
        'Name':CustomersName.text,
        'PhoneNO:':CustomersTell.text,
        'Style':CustomerStyleNumber.text,
        'Measurement':CustomersMeasure.text,
        "Date":Todaydate(),

      });

    }catch(e){

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:Text('Load New information'),
          backgroundColor: myColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [

            Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: CustomersName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Enter Customers Name',
                            label: Center(child: Text('Customers Name')),
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Customers Name ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: CustomersTell,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Customers Tel:',
                            label: Center(child: Text('Phone Number ')),
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter customers phoneNo:';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: CustomerStyleNumber,
                          decoration: InputDecoration(
                            hintText: 'Enter your customers style name or number',
                            label: Center(child: Text('style name or number')),
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter style name or number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller:CustomersMeasure ,
                          decoration: InputDecoration(
                            hintText: 'Enter customers measurement',
                            label: Center(child: Text('Customers measurement')),
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter customers measurement';
                            }
                            return null;
                          },
                        ),
                      ),

                      ElevatedButton(
                          onPressed: () {
                            //Show dialog

                            // validate the dropdown button

                            if (_formkey.currentState!.validate()) {
                              // createUser();

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
                                          child: Text('Check your Detail')),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Name :' + CustomersName.text,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Customers Tel::' + CustomersTell.text,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Customers style name or Styleno:' + CustomerStyleNumber.text,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Customers measurement:' + CustomersMeasure.text,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                        ),

                                        ListTile(
                                            trailing: ElevatedButton(
                                              onPressed: () {
                                                addUser();
                                                Navigator.pop(context);
                                                CustomersName.clear();
                                                CustomersMeasure.clear();
                                                CustomersTell.clear();
                                                CustomersMeasure.clear();

                                                showShortToast(
                                                    'Loaded successfully');
                                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminstratiomPage()));
                                                child: Text("Save");

                                                //Navigator.of(context);
                                              },
                                              child: Text('SAVE'),
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
                                                    fontSize: 20),
                                              ),
                                            ))
                                      ],
                                    );
                                  });
                            }
                            print('Erro');
                          },
                          child: Icon(
                            Icons.save,
                            color: Colors.red,
                            size: 30.0,
                          ))
                    ],
                  ),
                )),

          ]),
        ));
  }
}


