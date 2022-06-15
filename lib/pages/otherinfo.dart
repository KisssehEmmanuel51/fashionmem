import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentbee/component/myclass.dart';

class ImageLoading extends StatefulWidget {
  const ImageLoading({Key? key}) : super(key: key);

  @override
  State<ImageLoading> createState() => _ImageLoadingState();
}

class _ImageLoadingState extends State<ImageLoading> {
   File? iimage;
    ImagePicker _picker=ImagePicker();
  Future getImage(ImageSource source) async {
   try{
     final image =await _picker.pickImage(source: source);
     if(image==null)return ;

     final tempra=File(image.path);
     setState((){this.iimage=tempra;});
   } on PlatformException catch(e){
     String Erro=e.toString();
     showShortToast(Erro);

   }





    // setState((){
    //   XFile? currentImage=imageLi;
    //
    // });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              iimage!=null?Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(child: Image.file(iimage!,height: 150,width:135,fit: BoxFit.fill,)),
              ):
              FlutterLogo(),
             
              ElevatedButton(onPressed: (){
                getImage(ImageSource.gallery);
              }, child: Text('Gallary')),
              ElevatedButton(onPressed: (){
                getImage(ImageSource.camera);
              }, child: Text('Camera')),

            ],
          ),
        ),
      )
    ) ;

  }
}
