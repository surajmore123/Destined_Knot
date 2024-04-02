import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class otp extends StatefulWidget {
  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
//  TextEditingController phoneController = TextEditingController();
  var phone ="";
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextField(
              onChanged: (value) {
                phone = value;
              },
              keyboardType: TextInputType.phone,
             
              decoration: InputDecoration(
                  hintText: 'Enter the Number',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(0.8),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme:
                              CountryListThemeData(bottomSheetHeight: 500),
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          },
                        );
                      },
                      child: Text(
                          "${selectedCountry.flagEmoji}+ ${selectedCountry.phoneCode}"),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
        ElevatedButton(
  onPressed: () async {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Format the phone number to include the country code
    String formattedPhoneNumber = '+${selectedCountry.phoneCode}$phone';

    // Verify the formatted phone number
    await auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber,

codeAutoRetrievalTimeout: (
  String verificationId) {  },
   codeSent: (String verificationId, int? forceResendingToken) { 
  
    }, 
   verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  },
    verificationFailed: (FirebaseAuthException error) {  });
  },
  child: Text('verify')
)
          ],
        ),
      ),
    );
  }
}
