import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

import 'package:studentbee/component/myclass.dart';
import 'package:studentbee/pages/adminpage.dart';
import 'package:studentbee/pages/fashion_hm.dart';

class LoadApprentDatail extends StatefulWidget {
  const LoadApprentDatail({Key? key}) : super(key: key);

  @override
  _LoadApprentDatailState createState() => _LoadApprentDatailState();
}

class _LoadApprentDatailState extends State<LoadApprentDatail> {
  final _admiformkey = GlobalKey<FormState>();
  final Reff = FirebaseFirestore.instance.collection('RegistionNew');
  TextEditingController FullName = TextEditingController();
  TextEditingController IndexNumber = TextEditingController();
  TextEditingController DoB = TextEditingController();
  TextEditingController GuidianNo = TextEditingController();
  TextEditingController DigitalAdress = TextEditingController();
  TextEditingController NameOfGuidance = TextEditingController();
  String? Residence;
  String selectval = 'Level of edu.';
  List<String> listitems = [
    'Level of edu.',
    'BECE',
    'WASSCE',
    'O LEVEL',
    'DIPLOMA',
    'DEGREE',
    'DROPOUT',
    'None'
  ];


  XFile? pickedImage;
  late File imageFile;
  late String fileName;
  bool isImageIsloaded = false;
  bool isPressed = false;

  // loadMe(){
  //   setState((){
  //     upload();
  //   });
  // }

  void _starLaading() async {
    setState(() {
      isPressed = true;
    });

    await Future.delayed(Duration(seconds: 30));

    setState(() {
      isPressed = false;

    });
  }

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();

    pickedImage = await picker.pickImage(
        source:
        inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920);

    fileName = path.basename(pickedImage!.path);
    imageFile = File(pickedImage!.path);
    setState(() {});

  }
// to upload data to fireStore. thus image and text
  AddRegister() async {
    setState(() {
      selectval.toString();
    });
    Reference storageGentReff =
    FirebaseStorage.instance.ref().child("RegistrationImage");

    UploadTask uploadTask = storageGentReff.putFile(imageFile);

    await uploadTask.whenComplete(() => null);
    final downlaodUrl = await storageGentReff.getDownloadURL();
    await Reff.add({
      "ImageUrl": downlaodUrl,
      "FullName": FullName.text,
      "DoB": DoB.text,
      "GuidaneName": NameOfGuidance.text,
      "Residence": Residence.toString(),
      "GuidanceNo": GuidianNo.text,
      "DateOfReg": Todaydate(),
      "Course": selectval.toString(),
    }).whenComplete(() {
      showShortToast("Successful");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoadApprentDatail()));
    });
  }

  Widget uploadWidget() {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(imageFile),
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Form(
                  key: _admiformkey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              label: Center(child: Text('Full name')),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            controller: FullName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: IndexNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter your number of yr signed',
                              label: Center(child: Text('No.years signed')),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter  ';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: DoB,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: 'DD/MM/YYYY',
                              label: Center(child: Text('Date of birth')),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your DoB';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: DigitalAdress,
                            decoration: InputDecoration(
                              hintText: 'Enter your Digital address',
                              label: Center(child: Text('DigitaAdress')),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your DigitaAdress';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: NameOfGuidance,
                            decoration: InputDecoration(
                              hintText: 'Full name of Guidance',
                              label: Center(child: Text('Name of Guidance')),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your informations here';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: GuidianNo,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter your parentNo',
                              label: Center(child: Text('ParentNo')),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your ParentNo';
                              }
                              return null;
                            },
                          ),
                        ),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Align(
                              child: Text(
                                'Marrietal status',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          ListTile(
                            title: Text("Married"),
                            leading: Radio(
                                value: "Married",
                                groupValue: Residence,
                                onChanged: (value) {
                                  setState(() {
                                    Residence = value.toString();
                                  });
                                }),
                            trailing: DropdownButton(
                              value: selectval,
                              onChanged: (value) {
                                setState(() {
                                  selectval = value.toString();
                                });
                              },
                              items: listitems.map((itemone) {
                                return DropdownMenuItem(
                                    value: itemone, child: Text(itemone));
                              }).toList(),
                            ),
                          )
                        ]),
                        ListTile(
                          title: Text("Single"),
                          leading: Radio(
                              value: "Single",
                              groupValue: Residence,
                              onChanged: (value) {
                                setState(() {
                                  if (Residence.toString() !=
                                      "Clik to Select course") {
                                    Residence = value.toString();
                                  }
                                });
                              }),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              //Show dialog

                              // validate the dropdown button

                              if (_admiformkey.currentState!.validate()) {
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
                                              'Name :' + FullName.text,
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'No. of yrs signed :' +
                                                  IndexNumber.text,
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Date of Birth :' + DoB.text,
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Guidance no:' + GuidianNo.text,
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Digital Address :' +
                                                  DigitalAdress.text,
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Guidance No :' + GuidianNo.text,
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Marital status : $Residence',
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Level of Edu :$selectval',
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                          ListTile(
                                              trailing: ElevatedButton(
                                                onPressed: () {

                                                  AddRegister();
                                                  showShortToast(
                                                      'Loaded successfully');
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             StudentAdmi()));
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AdminstratiomPage()));

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
            ),

            // ElevatedButton(
            //     onPressed: () {
            //       upload();
            //     },
            //     child: Text('load'))
            // ElevatedButton.icon(
            //
            //
            //     icon: isPressed?CircularProgressIndicator(color: Colors.white,):Icon(Icons.send),
            //     label: Text(isPressed?'Loading....':'Start',
            //       style: TextStyle(fontSize: 30),),
            //     onPressed: (){
            //       setState((){
            //         isPressed=true;
            //       });
            //
            //       AddRegister();
            //     }
            //
            //
            // )

          ],
        ),




      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    //This button selects the image......
                    isImageIsloaded
                        ? uploadWidget()
                        : Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    elevation: 5,
                                    content:
                                    const Text('Select of image source'),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton.icon(
                                              onPressed: () {
                                                _upload('camera');
                                                Navigator.pop(context);
                                                isImageIsloaded = true;
                                              },
                                              icon: const Icon(Icons.camera),
                                              label: const Text('camera')),
                                          ElevatedButton.icon(
                                              onPressed: () {
                                                _upload('gallery');
                                                Navigator.pop(context);
                                                isImageIsloaded = true;
                                              },
                                              icon: const Icon(
                                                  Icons.library_add),
                                              label: const Text('Gallery')),
                                        ],
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              children: [
                                Text("Click!"),
                                Icon(
                                  Icons.upload_file,
                                  size: 40.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                    ),
                    // this contains the textfield and load button
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
