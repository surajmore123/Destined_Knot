import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class partnerPrefHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Destined',
              style: TextStyle(color: Colors.red),
            ),
            Icon(
              Icons.all_inclusive,
              color: Colors.black, // Change color here
            ),
            Text(
              'Knot',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      body:  Stack(
          children: [
             SizedBox(
                // height: MediaQuery.of(context).size.height + 700,
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                  double inputWidth = constraints.maxWidth - 50;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Center(
                                child: Text(
                              'Recommended Partner Preferences',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 240, 135, 170)),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              'We have set these Preference to show you the best Matches for your Profile.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 240, 135, 170)),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          'Tap on the field to edit',
                          style: TextStyle(
                            color: Color.fromARGB(255, 240, 135, 170),
                          ),
                          textAlign: TextAlign.center,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                         elevation: 10, // Ensure elevation is set to 0
  
                          
                            child: SizedBox(
                              width: inputWidth,
                              height: 280,
                              child: Column(
                                children: [
                                  Container(
                                    width: inputWidth - 20,
                                    height: 280,
                                    child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                   
                                      children: [
                                        ListTile(
                                          leading: Text('Basic Details',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 240, 135, 170))),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      151, 50, 156, 54)),
                                              child: Icon(
                                                Icons.calendar_month,
                                                color: Colors.white,
                                              )),
                                          title: Text(
                                            'Age Range',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    195, 158, 158, 158),
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            '24 to 30',
                                            style: TextStyle(
                                                color: Color.fromARGB(225, 0, 0, 0),
                                                fontSize: 18),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      151, 50, 156, 54)),
                                              child: Icon(
                                                Icons.height,
                                                color: Colors.white,
                                              )),
                                          title: Text(
                                            'Height Range',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    195, 158, 158, 158),
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            '''4'5 to 5'5''',
                                            style: TextStyle(
                                                color: Color.fromARGB(225, 0, 0, 0),
                                                fontSize: 18),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      151, 50, 156, 54)),
                                              child: Icon(
                                                FontAwesomeIcons.userGroup,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text(
                                            'Marital Status',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    195, 158, 158, 158),
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            'Never Married',
                                            style: TextStyle(
                                                color: Color.fromARGB(225, 0, 0, 0),
                                                fontSize: 18),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                           elevation: 10,
                           
                            child: SizedBox(
                              width: inputWidth,
                              height: 280,
                              child: Column(
                                children: [
                                  Container(
                                    width: inputWidth - 20,
                                    height: 280,
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          leading: Text('Community',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 240, 135, 170))),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      213, 245, 92, 3)),
                                              child: Icon(
                                                FontAwesomeIcons.book,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Religion',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text(
                                            'Baudh',
                                            style: TextStyle(
                                                color: Color.fromARGB(225, 0, 0, 0),
                                                fontSize: 18),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      213, 245, 92, 3)),
                                              child: Icon(
                                                FontAwesomeIcons.users,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Community',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text('Open to all',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(225, 0, 0, 0),
                                                  fontSize: 18)),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      213, 245, 92, 3)),
                                              child: Icon(
                                                FontAwesomeIcons.globe,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Mother Tongue',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text('Marathi',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(225, 0, 0, 0),
                                                  fontSize: 18)),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                            elevation: 10,
                         
                            child: SizedBox(
                              width: inputWidth,
                              height: 220,
                              child: Column(
                                children: [
                                  Container(
                                    width: inputWidth - 20,
                                    height: 220,
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          leading: Text('Location',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 240, 135, 170))),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      150, 191, 79, 206)),
                                              child: Icon(
                                                FontAwesomeIcons.globeAsia,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Country living in',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text(
                                            'India',
                                            style: TextStyle(
                                                color: Color.fromARGB(225, 0, 0, 0),
                                                fontSize: 18),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      150, 191, 79, 206)),
                                              child: Icon(
                                                FontAwesomeIcons.locationDot,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('State living in',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text('Open to all',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(225, 0, 0, 0),
                                                  fontSize: 18)),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Card(
                         elevation: 10,
                       
                            child: SizedBox(
                              width: inputWidth,
                              height: 360,
                              child: Column(
                                children: [
                                  Container(
                                    width: inputWidth - 20,
                                    height: 360,
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          leading: Text('Education & Career',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 240, 135, 170))),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      212, 230, 163, 19)),
                                              child: Icon(
                                                FontAwesomeIcons.graduationCap,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Qualification',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text(
                                            'Open to all',
                                            style: TextStyle(
                                                color: Color.fromARGB(225, 0, 0, 0),
                                                fontSize: 18),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      212, 230, 163, 19)),
                                              child: Icon(
                                                FontAwesomeIcons.building,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Working with',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text('Open to all',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(225, 0, 0, 0),
                                                  fontSize: 18)),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      212, 230, 163, 19)),
                                              child: Icon(
                                                FontAwesomeIcons.briefcase,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Profession',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text('Marathi',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(225, 0, 0, 0),
                                                  fontSize: 18)),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      212, 230, 163, 19)),
                                              child: Icon(
                                                FontAwesomeIcons.moneyCheck,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Annual income',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text('INR 2 lakhs to 20 lakhs',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(225, 0, 0, 0),
                                                  fontSize: 18)),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                           
                            elevation: 10,
                            child: SizedBox(
                              width: inputWidth,
                              height: 220,
                              child: Column(
                                children: [
                                  Container(
                                    width: inputWidth - 20,
                                    height: 220,
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          leading: Text('Other Details',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 240, 135, 170))),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      149, 177, 61, 223)),
                                              child: Icon(
                                                FontAwesomeIcons.user,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Profile Created by',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text(
                                            'Open to all',
                                            style: TextStyle(
                                                color: Color.fromARGB(225, 0, 0, 0),
                                                fontSize: 18),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      149, 177, 61, 223)),
                                              child: Icon(
                                                FontAwesomeIcons.xmark,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                          title: Text('Diet',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      195, 158, 158, 158),
                                                  fontSize: 15)),
                                          subtitle: Text('Open to all',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(225, 0, 0, 0),
                                                  fontSize: 18)),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(195, 158, 158, 158),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 80,)
                      ],
                    ),
                  );
                }),
              ),
            
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 140,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Scaffold(
                                // Wrapping with Scaffold for app bar and other functionalities
                                body: partnerPrefHome(),
                              );
                            },
                            transitionDuration: Duration(milliseconds: 1500),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              var begin = Offset(1.0, 0.0);
                              var end = Offset.zero;
                              const curve = Curves.ease;
      
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
      
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
      
                        print('selected');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Colors.white,
                      ),
                      child: Icon(Icons.forward, size: 30, color: Colors.pink),
                    ),
                  ),
                ))
          ],
        ),
    
    );
  }
}
