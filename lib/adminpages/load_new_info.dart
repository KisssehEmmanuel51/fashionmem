import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/component/myclass.dart';
import 'package:intl/intl.dart';

FirebaseFirestore Ref = FirebaseFirestore.instance;

class AddNotes extends StatefulWidget {

  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController notes = TextEditingController();
  CollectionReference myadd= FirebaseFirestore.instance.collection('MyNote');
  final _formkey = GlobalKey<FormState>();



  today(){
   return DateFormat('yyyy-MM-dd-kk-mm').format(DateTime.now()).toString();
    //DateFormat.yMEd().add_jms().format(DateTime.now());
  }

  addUser()async{
    try{
      myadd.add({
        'myNote':notes.text,
        'dat':Todaydate().toString(),

      });

    }catch(e){

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:Text('Load New information')
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Form(
              key: _formkey,
              child: TextFormField(

                decoration: InputDecoration(
                  labelText: 'Enter note',
                  border: OutlineInputBorder()
                ),
                controller: notes,
                maxLines: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your informations here';
                  }
                  return null;
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                       // createUser();
                        addUser();
                        notes.clear();
                        showShortToast('DONE!!');


                      }
                      print('Erro');
                    },
                    child: Text("Save")))
          ]),
        ));
  }
}


