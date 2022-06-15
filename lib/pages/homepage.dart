import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/adminpages/customer_request.dart';
import 'package:studentbee/component/myclass.dart';
import 'package:studentbee/pages/adminpage.dart';
import 'package:studentbee/pages/fashion_hm.dart';
import 'package:studentbee/pages/trypkor.dart';
import 'package:studentbee/pages/what_we_do.dart';
import 'package:studentbee/student_pages/view_news.dart';
import 'package:studentbee/student_pages/view_note.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _adminName = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        shadowColor: Colors.pinkAccent,
        elevation: 10,
        backgroundColor: myColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        title: Center(
          child: Text(
            "WHITEMAN FASHION ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'titlefamily'),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [Image(image: AssetImage('images/wflogo.png'))],
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.blue,
        backgroundColor: Colors.black,
        elevation: 20,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FashionHomePage()));
        },
        child: Column(
          children: [
            Icon(
              Icons.remove_red_eye,
              size: 40.0,
              color: Colors.red,
            ),
            const Text(
              "STYLES",
              style: TextStyle(fontSize: 7.0),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        child: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(),
                      child: Column(
                        children: const [
                          Image(
                              height: 100.0,
                              width: 100.0,
                              image: AssetImage(
                                "images/wflogo.png",
                              )),
                          Text(
                            "WHITEMAN FASHION ",
                            style: TextStyle(),
                          )
                        ],
                      )),
                  const Divider(
                    color: Colors.blue,
                    thickness: 5.0,
                    height: 5.0,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing:
                        const Icon(Icons.home, color: Colors.black, size: 30.0),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutSchool()));
                    },
                    title: const Text(
                      'What we do',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.all_inbox_rounded,
                        color: Colors.black, size: 30.0),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FashionHomePage()));
                    },
                    title: const Text(
                      'Our Styles',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(
                      Icons.account_box_rounded,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerRequest()));
                    },
                    title: const Text(
                      'Make a request',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.settings,
                        color: Colors.black, size: 30.0),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadInfo()));

                    },
                    title: const Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.account_box_rounded,
                        color: Colors.black, size: 30.0),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              elevation: 5,
                              content: const Text(
                                  'PLEASE THIS PAGE IS FOR ADMIN ONLY.  Thank you!!!',
                                style: TextStyle(fontSize: 9),),
                              title: Image(
                                image: AssetImage('images/wflogo.png'),
                                height: 100,
                                width: 100,
                              ),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _adminName,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        label: Text('Admin Name'),
                                        hintText: "Enter your Admin name"),
                                  ),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      label: const Text('Password'),
                                      hintText: "Enter your password"),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel')),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            if (_passwordController.text
                                                        .toString() ==
                                                    "12345" &&
                                                _adminName.text.toString() ==
                                                    "admin") {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdminstratiomPage()));
                                            } else {
                                              showShortToast(
                                                  "You are not an admin. you cannot assess this page");
                                            }

                                            // print(_passwordController);
                                            // print(admin);
                                            // print(adminpasssword);
                                          },
                                          child: const Text("Enter"))
                                    ],
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    title: const Text(
                      'ADMIN ONLY',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.admin_panel_settings_outlined,
                        color: Colors.black, size: 30.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              // the carousel display
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 450.0,
                    width: MediaQuery.of(context).size.width,
                    child: Carousel(
                      dotSpacing: 15.0,
                      overlayShadowSize: 3.0,
                      dotIncreasedColor: Colors.pinkAccent,
                      autoplayDuration: const Duration(seconds: 60),
                      borderRadius: true,
                      animationCurve: Curves.bounceOut,
                      //overlayShadowColors: Colors.orangeAccent,
                      dotSize: 6.0,
                      boxFit: BoxFit.fill,
                      images: const [
                        ExactAssetImage("images/d1.jpg"),
                        ExactAssetImage("images/d2.jpg"),
                        ExactAssetImage("images/d4.jpg"),
                        ExactAssetImage("images/d6.jpg"),
                        ExactAssetImage("images/d7.jpg"),
                        ExactAssetImage("images/d8.jpg"),
                        ExactAssetImage("images/d9.jpg"),
                        ExactAssetImage("images/d10.jpg"),
                        ExactAssetImage("images/d13.jpg"),
                        ExactAssetImage("images/d15.jpg"),
                        ExactAssetImage("images/q4.jpg"),
                        ExactAssetImage("images/q7.jpg"),
                        ExactAssetImage("images/w111.jpg"),
                      ],
                    )),
              ),

              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.orangeAccent,
                  color: myColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0)),
                  ),
                  child: Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(70.0),
                          bottomLeft: Radius.circular(100.0),
                          topLeft: Radius.circular(10)
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topCenter,
                            colors: [

                             Colors.white,
                             Colors.white,
                             Colors.white,


                            ]),
                      border: Border.all(
                        color:Colors.pink,
                        width: 4.0
                      )

                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 170.0,
                    child: Center(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Expanded(
                          child: DefaultTextStyle(
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black ,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'titlefamily'),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  FadeAnimatedText(

                                      duration: Duration(seconds: 20),
                                      'DRESS LIKE YOU HAVE MADE SOMETHING OF YOURSELF IN THE WORLD EVEN IF NOTHING'),
                                  FadeAnimatedText(
                                      duration: Duration(seconds: 20),
                                      'You can have anything you want in life if you dress for it'),
                                  FadeAnimatedText(
                                      duration: Duration(seconds: 20),
                                      'Clothes mean nothing until someone lives in them. '),
                                  FadeAnimatedText(
                                      duration: Duration(seconds: 20),
                                      'Style is a way to say who you \n\ are without having to speak'),
                                  FadeAnimatedText('Just take it !!!!'),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                   Icon(Icons.facebook,size: 70,color: Colors.blue,),
                    Text("follow us on facebook \n\ whiteman fashion")

                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
