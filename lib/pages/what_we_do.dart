import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentbee/component/myclass.dart';

class AboutSchool extends StatefulWidget {
  const AboutSchool({Key? key}) : super(key: key);

  @override
  State<AboutSchool> createState() => _AboutSchoolState();
}

class _AboutSchoolState extends State<AboutSchool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(8)
        ),
        backgroundColor:myColor,
        shadowColor: Colors.blue,
        elevation: 7,
        title: Text('Services we provide',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,fontSize:20.0,

          ),),

      ),
      body: ListView(

        children: [

          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width*0.8,
            child: Column(
              children: [
             Text('whiteMan fashion Center is a company which is  into products of shirt,dresses'
                 'both in small and large quantity on affordable prices. We also create avenue for the youths '
                 'learn fashion and desgining which anables them to have a vocation of themself'
              'We sew items like jesseys,jacket wedding, gowns, school uniforms,every kind of '
                 'African wears'
                 'clients as a freelance fashion designer. we just spitballing here, and keep in mind we’ve purposely made it broader than just “fashion design” '
                 'to help you get inspired and think outside the box.'
                  '\n\ '


                 'Creative Services Color direction'
                '\n\ '

                  'Trend / mood boards'
                 '\n\ Full collection design'
                 '\n\ Textile design'
                 '\n\ Trim / Finding / Hangtag / Label design'
                 '\n\ Merchandising'
                 '\n\ Catalog layout'
                 '\n\ Photo shoot art direction / management'
                 '\n\ Technical Services'
                 '\n\ Tech sketches'
                 '\n\ Tech packs'
                 '\n\ Textile repeats / specs'
                 '\n\ Spec / grading'
                 '\n\ Pattern drafting'
                 'Proto / sample review / commenting'
                 'Fittings'
                 'Vendor correspondence / follow up'
                 'Sourcing Services'
                 'New fabrics / trims'
                 'New factories / suppliers'
                 'Price / MOQ negotiation'
                 'Vendor correspondence / follow up'
                 'Consulting Services'
                 'Collection / merchandising review / analysis:'
                 'what categories are missing / not needed?'
                 'Sales analysis / reporting:'
                 'suggestions for moving forward (what styles to run again in new colors, what should be dropped, etc)'
                'Market analysis'
                'untapped opportunities / market segments'
                'Distribution analysis'
                'New sales channels (wholesale, retail, DTC, pop-up shop, email, web, etc)'
                'And beyond…'
                'Marketing / sales / promotion'
               'Are you really good at building Pinterest following that gets a lot of click throughs? Startup brands may be dying for this!'
                'You know how to build and run an email list? Trading companies who are a little behind the times may be dying for this!'
                        // references
                      '\n'
                     ' \n\ Reff:'
                 'https://successfulfashiondesigner.com/freelance-fashion-design-services/',
               style: TextStyle(fontSize: 18.0,),

             )



                ],
            ),
          )

        ],
      ),
    );
  }
}
