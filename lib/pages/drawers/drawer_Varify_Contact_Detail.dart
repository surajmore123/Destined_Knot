import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../list/country_code.dart';
import '../skip/hobbiesInterest.dart';
import '../variables.dart';

class verify_contact extends StatefulWidget {
  static String verify = "";
  @override
  State<verify_contact> createState() => _verify_contactState();
}

class _verify_contactState extends State<verify_contact> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String formattedPhoneNumber = "";
  var code = "";
  @override
  void initState() {
    super.initState();
    countryList = parseJson(jsonText);
  }

  void updateCountryCode(String countryCode) {
    setState(() {
      selectedCountryCode = countryCode;
    });
  }

  void updatePhoneNumber(String phoneNumber) {
    setState(() {
      phoneController.text = phoneNumber;
    });
  }

  List<Map<String, String>> parseJson(String jsonString) {
    final Map<String, dynamic> parsed = json.decode(jsonString);
    final List<dynamic> countries = parsed['countries'];
    return countries
        .map((country) => {
              'code': country['code'].toString(),
              'name': country['name'].toString(),
            })
        .toList();
  }

  void showVerificationPopup(BuildContext context)
  {
    showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        content: Text('Mobile number has been verified',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 18, 214, 24)),),
      );

    });
    Future.delayed(Duration(seconds: 10),()
    {
       Navigator.of(context).pop(); // Close the dialog
            Navigator.of(context).pushReplacement( // Navigate to homepage
        MaterialPageRoute(builder: (context) => hobbiesInterest()),
      );
    }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Contact Details'),
        backgroundColor: Colors.pink.shade400,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Color.fromARGB(255, 236, 234, 234),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.smartphone,
                      size: 40,
                      color: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'You will receive an SMS with verification PIN to',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(selectedCountryCode,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        Text(
                          phoneController.text,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        TextButton(
                            onPressed: () {
                              showEditDialog(context);
                            },
                            child: Text('Edit',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.pink)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      onChanged: (value) {
                        code = value;
                      },
                      maxLines: 2,
                      //   controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          //            hintText: 'Mobile No.',
                          label: Text('Enter PIN',
                              style: TextStyle(color: Colors.pink))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      FirebaseAuth auth = FirebaseAuth.instance;

                      // Format the phone number to include the country code
                      //   String formattedPhoneNumber = '+${selectedCountryCode}$phoneController';
                      formattedPhoneNumber =
                          '+${selectedCountryCode + phoneController.text}';

                      // Verify the formatted phone number
                      await auth.verifyPhoneNumber(
                          phoneNumber: formattedPhoneNumber,
                          codeAutoRetrievalTimeout: (String verificationId) {},
                          codeSent: (String verificationId,
                              int? forceResendingToken) {
                            verify_contact.verify = verificationId;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => verify_contact()));
                          },
                          verificationCompleted:
                              (PhoneAuthCredential phoneAuthCredential) {},
                          verificationFailed: (FirebaseAuthException error) {});

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: Center(
                          child: Text('SEND PIN',
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('resendpin');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: Center(
                          child: Text('RESEND PIN',
                              style: TextStyle(color: Colors.pink))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                print('VERIFY');
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verify_contact.verify, smsCode: code);
                  await auth.signInWithCredential(credential);
                  showVerificationPopup(context);
                  
/*
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Scaffold(
                          // Wrapping with Scaffold for app bar and other functionalities
                          body: HomePage(),
                        );
                      },
                      transitionDuration: Duration(milliseconds: 1500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(0.0, 1.0);
                        var end = Offset.zero;
                        var curve = Curves.easeOutQuart;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: animation.drive(Tween(
                                  begin: Offset(0.0, 1.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.easeOutQuart))),
                          child: child,
                          // position: offsetAnimation,
                          // child: child,
                        );
                      },
                    ),
                  );
                  */
                } catch (e) {
                  print('put wrong otp');
                }


              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Center(
                    child:
                        Text('VERIFY', style: TextStyle(color: Colors.pink))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Note : ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: 'you can use Privacy option to hide your number',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  )),
            ])),

            SizedBox(
              height: 10,
            ),
            //  Text('''i'll do this later'''),
            InkWell(
                onTap: () {},
                child: Text(
                  '''i'll do this later''',
                  style: TextStyle(color: Colors.pink, fontSize: 16),
                )),
          ],
        ),
      ),
    );
  }

  void showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return
            //  buildEditDialog(context);
            StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Dialog(
                insetPadding: EdgeInsets.fromLTRB(0, 280, 0, 270),
                child: buildEditDialog(context, setState),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildEditDialog(BuildContext context, StateSetter setState) {
    return Center(
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: MediaQuery.of(context).size.height, end: 0),
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.translate(
            offset: Offset(0, value),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Edit Mobile No.',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Select a country'),
                      value: selectedCountry1,
                      onChanged: (String? newValue) {
                        setState(() {
                          //    selectedCountry = newValue;
                          selectedCountry1 = newValue!;
                          selectedCountryCode = countryList
                              .firstWhere((country) =>
                                  getCombinedValue(country) ==
                                  selectedCountry1)['code']
                              .toString();
                          //    selectedCountryCode = newValue.split('_')[0];
                        });
                      },
                      items: countryList.map<DropdownMenuItem<String>>(
                          (Map<String, String> country) {
                        return DropdownMenuItem<String>(
                          value: getCombinedValue(country),
                          child: Row(
                            children: [
                              Radio<String>(
                                value: getCombinedValue(country),
                                groupValue: selectedCountry1,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCountry1 = newValue!;

                                    selectedCountryCode =
                                        country['code'].toString();
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              Text(
                                getCombinedValue(country),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          //            hintText: 'Mobile No.',
                          label: Text('Mobile No.',
                              style: TextStyle(color: Colors.pink))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 250),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancle',
                              style: TextStyle(color: Colors.pink)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              updateCountryCode(selectedCountryCode);
                              updatePhoneNumber(phoneController.text);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Save',
                              style: TextStyle(color: Colors.pink)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
