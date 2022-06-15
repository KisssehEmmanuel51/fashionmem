// import 'package:flutter/material.dart';
//
// class ddgg extends StatefulWidget {
//   const ddgg({Key? key}) : super(key: key);
//
//   @override
//   State<ddgg> createState() => _ddggState();
// }
//
// class _ddggState extends State<ddgg> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       body: Column(
//
//         children: [
//
//         ],
//       ),
//
//     );
//   }
// }
// //////////////////////////////////////////////////////////////////////////
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:studentbee/component/myclass.dart';
//
// class StudentAdmi extends StatefulWidget {
//   StudentAdmi({Key? key}) : super(key: key);
//
//   @override
//   State<StudentAdmi> createState() => _StudentAdmiState();
// }
//
// class _StudentAdmiState extends State<StudentAdmi> {
//   final _admiformkey = GlobalKey<FormState>();
//   CollectionReference studientRegister =
//   FirebaseFirestore.instance.collection('Registion');
//   TextEditingController FullName = TextEditingController();
//   TextEditingController IndexNumber = TextEditingController();
//   TextEditingController DoB = TextEditingController();
//   TextEditingController GuidianNo = TextEditingController();
//   TextEditingController DigitalAdress = TextEditingController();
//   TextEditingController NameOfGuidance = TextEditingController();
//   String? Residence;
//   String selectval = 'Level of edu.';
//   List<String> listitems = [
//     'Level of edu.',
//     'BECE',
//     'WASSCE',
//     'O LEVEL',
//     'DIPLOMA',
//     'DEGREE',
//     'DROPOUT',
//     'None'
//   ];
//
//   //Students Registration class
//   AddRegister() {
//     studientRegister.add({
//       "FullName": FullName.text,
//       "DoB": DoB.text,
//       "GuidaneName": NameOfGuidance.text,
//       "IndexNumber": IndexNumber.text,
//       "Residence": Residence.toString(),
//       "GuidanceNo": GuidianNo.text,
//       "DateOfReg": Todaydate(),
//       "Course": selectval.toString(),
//     });
//   }
//
//   Camera(){
//
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: myColor,
//         title: Text('APPRENTICES REGISTER'),
//         shadowColor: Colors.red,
//         centerTitle: true,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: ListView(
//           children: [
//             Form(
//                 key: _admiformkey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'Enter your name',
//                             label: Center(child: Text('Full name')),
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLines: 1,
//                           controller: FullName,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please Enter your name';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: TextFormField(
//                           controller: IndexNumber,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             hintText: 'Enter your number of yr signed',
//                             label: Center(child: Text('No.years signed')),
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLines: 1,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please Enter  ';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: TextFormField(
//                           controller: DoB,
//                           keyboardType: TextInputType.datetime,
//                           decoration: InputDecoration(
//                             hintText: 'DD/MM/YYYY',
//                             label: Center(child: Text('Date of birth')),
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLines: 1,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please Enter your DoB';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: TextFormField(
//                           controller: DigitalAdress,
//                           decoration: InputDecoration(
//                             hintText: 'Enter your Digital address',
//                             label: Center(child: Text('DigitaAdress')),
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLines: 1,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please Enter your DigitaAdress';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: TextFormField(
//                           controller: NameOfGuidance,
//                           decoration: InputDecoration(
//                             hintText: 'Full name of Guidance',
//                             label: Center(child: Text('Name of Guidance')),
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLines: 1,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please Enter your informations here';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: TextFormField(
//                           controller: GuidianNo,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             hintText: 'Enter your parentNo',
//                             label: Center(child: Text('ParentNo')),
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLines: 1,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please Enter your ParentNo';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Column(children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 17.0),
//                           child: Align(
//                             child: Text(
//                               'Marrietal status',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             alignment: Alignment.topLeft,
//                           ),
//                         ),
//                         ListTile(
//                           title: Text("Married"),
//                           leading: Radio(
//                               value: "Married",
//                               groupValue: Residence,
//                               onChanged: (value) {
//                                 setState(() {
//                                   Residence = value.toString();
//                                 });
//                               }),
//                           trailing: DropdownButton(
//                             value: selectval,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectval = value.toString();
//                               });
//                             },
//                             items: listitems.map((itemone) {
//                               return DropdownMenuItem(
//                                   value: itemone, child: Text(itemone));
//                             }).toList(),
//                           ),
//                         )
//                       ]),
//                       ListTile(
//                         title: Text("Single"),
//                         leading: Radio(
//                             value: "Single",
//                             groupValue: Residence,
//                             onChanged: (value) {
//                               setState(() {
//                                 if (Residence.toString() !=
//                                     "Clik to Select course") {
//                                   Residence = value.toString();
//                                 }
//                               });
//                             }),
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             //Show dialog
//
//                             // validate the dropdown button
//
//                             if (_admiformkey.currentState!.validate()) {
//                               // createUser();
//
//                               showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return SimpleDialog(
//                                       backgroundColor: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.elliptical(6, 7)),
//                                       ),
//                                       title: Center(
//                                           child: Text('Check your Detail')),
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'Name :' + FullName.text,
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'No. of yrs signed :' +
//                                                 IndexNumber.text,
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'Date of Birth :' + DoB.text,
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'Guidance no:' + GuidianNo.text,
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'Digital Address :' +
//                                                 DigitalAdress.text,
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'Guidance No :' + GuidianNo.text,
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'Marital status : $Residence',
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             'Level of Edu :$selectval',
//                                             style: TextStyle(fontSize: 20.0),
//                                           ),
//                                         ),
//                                         ListTile(
//                                             trailing: ElevatedButton(
//                                               onPressed: () {
//                                                 AddRegister();
//                                                 Navigator.pop(context);
//                                                 FullName.clear();
//                                                 IndexNumber.clear();
//                                                 DoB.clear();
//                                                 DigitalAdress.clear();
//                                                 GuidianNo.clear();
//                                                 NameOfGuidance.clear();
//
//                                                 showShortToast(
//                                                     'Loaded successfully');
//                                                 // Navigator.push(
//                                                 //     context,
//                                                 //     MaterialPageRoute(
//                                                 //         builder: (context) =>
//                                                 //             StudentAdmi()));
//                                                 Navigator.pushReplacement(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             StudentAdmi()));
//
//                                                 //Navigator.of(context);
//                                               },
//                                               child: Text('SAVE'),
//                                             ),
//                                             leading: TextButton(
//                                               onPressed: () {
//                                                 // Navigator.of(context);
//                                                 Navigator.maybePop(context);
//                                               },
//                                               child: Text(
//                                                 'EXIT',
//                                                 style: TextStyle(
//                                                     color: Colors.red,
//                                                     fontSize: 20),
//                                               ),
//                                             ))
//                                       ],
//                                     );
//                                   });
//                             }
//                             print('Erro');
//                           },
//                           child: Icon(
//                             Icons.save,
//                             color: Colors.red,
//                             size: 30.0,
//                           ))
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
