import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

//dialog
 showMyDialog(){
   return SimpleDialog(
     backgroundColor: Colors.white
     ,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.all(Radius.elliptical(6, 7)),

     ),
     title: Center(child: Text('GENERAL ARTS2')),

     children: [
     ],

   );
 }

// to show toast to the user
void showShortToast(String msg) {
  Fluttertoast.showToast(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,

  );
}

CirclarProg(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 4.0,
            ),
          ),
          Text('Loading.....')
        ],
      ),
    ),
  );
}
LinearProgressIndicator LinearPro(){
  return LinearProgressIndicator(

  );
}
// to get todays date
 Todaydate(){
  String Dat2=DateFormat.yMEd().add_jms().format(  DateTime.now());
  return Dat2.toString();
}

Color myColor = Color(0xcd670101);

 // Loading button

 CachedImages(BuildContext context,String Url,Widget Img  ){
  return CachedNetworkImage(
    imageUrl: Url,
    imageBuilder: (context, imageProvider) => Img,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}


// Widget build(BuildContext context) => DefaultTabController(
//     length: 4,
//     child: Scaffold(
//       appBar: AppBar(
//         actions: [
//           Image(image: AssetImage('images/wflogo.png'))
//         ],
//         title: Text( 'All the styles you want',style: TextStyle(
//             color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.bold
//         ),
//         ),
//         backgroundColor:myColor,
//         bottom:  TabBar(
//           labelColor: Colors.white,
//           indicatorColor: Colors.blue,
//           indicatorWeight: 5.0,
//           tabs: [
//             Tab(text: 'Gent',icon: Icon(Icons.star,color: Colors.amber),),
//             Tab(text: 'Ladies',icon: Icon(Icons.star,color: Colors.amber),),
//             Tab(text: 'Kids',icon: Icon(Icons.star,color: Colors.amber),),
//             Tab(text: 'Both',icon: Icon(Icons.star,color: Colors.amber),),
//           ],
//         ),
//       ),
//       body: Container(
//         color: Colors.pink,
//         child: TabBarView(
//           children: [
//             GentWear(),
//             //NewsRoom(),
//             LadiesWear(),
//             KidsWear(),
//             BothWears(),
//
//
//           ],
//         ),
//       ),
//     ));
////////////////////////////////////////////////////////////
//ListTile(
//                   leading:
//                       CachedNetworkImage(
//                         imageUrl: data['ImageUrl'].toString(),
//                         placeholder: (context, url) => CircularProgressIndicator(),
//                         errorWidget: (context, url, error) => Icon(Icons.error),
//                       ),
//
//
//                   subtitle: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Column(
//                         children: [
//
//                           Align(
//                             alignment: AlignmentDirectional.bottomStart,
//                             child: Text(
//                               'Date of birth: ' + data['DoB'],
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                           Align(
//                             alignment: AlignmentDirectional.bottomStart,
//                             child: Text(
//                               'GuidName: ' + data['GuidaneName'],
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                           Align(
//                             alignment: AlignmentDirectional.bottomStart,
//                             child: Text(
//                               'Guidian No: ' + data['GuidanceNo'],
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                           Align(
//                             alignment: AlignmentDirectional.bottomStart,
//                             child: Text(
//                               'Marital Status: ' + data['Residence'],
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       )),
//                   title: Align(
//                     alignment: AlignmentDirectional.topCenter,
//                     child: Text(
//                       'NAME :' + data['FullName'],
//                       style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   trailing: Column(
//                     children: [
//                       Text(
//                         'Level of edu: ' + data['Course'],
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       Text(
//                         'Date of Admission :\n\ ' + data['DateOfReg'],
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                       Expanded(
//                           flex: 1,
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.call,
//                                 color: Colors.green,
//                               )))
//                     ],
//                   ),
//                 ),