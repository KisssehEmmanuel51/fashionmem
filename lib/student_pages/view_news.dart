import 'package:flutter/material.dart';
class LoadInfo extends StatefulWidget {
  const LoadInfo({Key? key}) : super(key: key);

  @override
  State<LoadInfo> createState() => _LoadInfoState();
}

class _LoadInfoState extends State<LoadInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(

              child: Text('We are open and available for all your fashion styles for both sex,'
              'Contact us to groom you for that glamorous occasion.Our services are also affordable and loving'
                  'Look no further come to our avail and you will be stunning'
              ),
            ),
          )
        ],
      ),
    );
  }
}
