import 'package:flutter/material.dart';


class Fashion_home extends StatefulWidget {
  const Fashion_home({Key? key}) : super(key: key);

  @override
  State<Fashion_home> createState() => _Fashion_homeState();
}

class _Fashion_homeState extends State<Fashion_home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SafeArea(
        child: Text('Courses studied under each course'),
      ),
    );
  }
}
