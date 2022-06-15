import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

import 'package:studentbee/component/myclass.dart';

class LoadNRecieveNews extends StatefulWidget {
  const LoadNRecieveNews({Key? key}) : super(key: key);

  @override
  _LoadNRecieveNewsState createState() => _LoadNRecieveNewsState();
}

class _LoadNRecieveNewsState extends State<LoadNRecieveNews> {
  String selectval = 'Gents';
  List<String> listitems = ['Gents', 'Ladies', 'Kids', 'Both'];
  FirebaseFirestore LoadGentFirestore = FirebaseFirestore.instance;
  TextEditingController NameOrNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  String? Residence;
  XFile? pickedImage;
  late File imageFile;
  late String fileName;
  bool isImageIsloaded = false;
  bool isPressed = false;

  loadMe(){
    setState((){
      upload();
    });
  }

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
  upload() async {
    setState(() {
      selectval.toString();
    });
    Reference storageGentReff =
    FirebaseStorage.instance.ref().child(selectval).child(fileName);

    UploadTask uploadTask = storageGentReff.putFile(imageFile);

    await uploadTask.whenComplete(() => null);
    final downlaodUrl = await storageGentReff.getDownloadURL();
    await LoadGentFirestore.collection(selectval).add({
      "ImageUrl": downlaodUrl,
      "discription": NameOrNumber.text
    }).whenComplete(() {
      showShortToast("Successful");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoadNRecieveNews()));
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
            ListTile(
              title: Text('Select the group'),
              trailing: DropdownButton(
                value: selectval,
                onChanged: (value) {
                  setState(() {
                    selectval = value.toString();
                  });
                },
                items: listitems.map((itemone) {
                  return DropdownMenuItem(value: itemone, child: Text(itemone));
                }).toList(),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: NameOrNumber,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter postal No. or name',
                  label: Center(child: Text('Dress Name or number')),
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Dress Name or number ';
                  }
                  return null;
                },
              ),
            ),

            // ElevatedButton(
            //     onPressed: () {
            //       upload();
            //     },
            //     child: Text('load'))
            ElevatedButton.icon(


                icon: isPressed?CircularProgressIndicator(color: Colors.white,):Icon(Icons.save),
                label: Text(isPressed?'Loading....':'Save',
                  style: TextStyle(fontSize: 30),),
                onPressed: (){
                  setState((){
                    isPressed=true;
                  });

                  upload();
                }


            )

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
