import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../drawers/State.dart';
import '../drawers/partnerPreferences/partnerPrefHome.dart';
import '../list/country.dart';
import '../variables.dart';
import 'familyDetails.dart';

class familyFinance extends StatefulWidget {
  @override
  State<familyFinance> createState() => _familyFinanceState();
}

class _familyFinanceState extends State<familyFinance>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isDropdownOpened = false;
  bool _showYes = true;
  bool _showNo = false;
  String? selectedState;
  String? selectedCity;
  bool selectedfield = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0), // Start from the left of the screen
      end: Offset(2.1, 0.0), // End at the right of the screen
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _slideContainer() {
    _controller.forward();
    setState(() {
      _showYes = false;
      _showNo = true;
    });
  }

  void _slideContainer1() {
    _controller.reverse();
    setState(() {
      _showYes = true;
      _showNo = false;
    });
  }

  void checkfields() {
    if (selectFinanceSts.isNotEmpty ||
        selectedCountry!.isNotEmpty ||
        selectedState!.isNotEmpty) {
      setState(() {
        selectedfield = true;
      });
    } else {
      setState(() {
        selectedfield = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.pink,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => familyDetails()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      /*
      Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              // height: MediaQuery.of(context).size.height + 700,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double inputWidth = constraints.maxWidth - 50;
                return Column(

      */
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double inputWidth = constraints.maxWidth - 50;
                return Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 207, 238, 226),
                            // border: Border.all(color: Colors.pink),

                            shape: BoxShape.circle),
                        child: Stack(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 18, left: 10),
                              child: Icon(
                                Icons.person,
                                //  size: 45,
                                size: 43,
                                color: Color.fromARGB(255, 135, 228, 132),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 18, left: 30),
                              child: Icon(
                                Icons.person,
                                //  size: 45,
                                size: 43,
                                color: Color.fromARGB(255, 132, 228, 191),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 19, left: 15),
                                child: DecoratedIcon(
                                  icon: Icon(
                                    size: 50,
                                    Icons.person,
                                    color: Color.fromARGB(255, 57, 223, 159),
                                  ),
                                  decoration: IconDecoration(
                                      border: IconBorder(
                                          color: Colors.white, width: 3)),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: inputWidth,
                      child: Text(
                        'Add family finance details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 240, 135, 170)),
                      ),
                    ),
                    Container(
                      width: inputWidth,
                      child: Text(
                        'This really helps find common connections',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: inputWidth,
                      child: Text(
                        'Your Family Location',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color.fromARGB(255, 240, 135, 170)),
                      ),
                    ),
                    Container(
                      width: inputWidth,
                      child: Text(
                        'You live with your family?',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: _slideContainer1,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.27,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Center(
                                child: Text(
                                    // onTap: _slideContaine1,
                                    'Yes',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ),
                          Positioned(
                              left: inputWidth - 100,
                              child: InkWell(
                                onTap: _slideContainer,
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                  ),
                                  child: Center(
                                    child: Text(
                                        //   onTap: _slideContainer,
                                        'No',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              )),
                          SlideTransition(
                            position: _offsetAnimation,
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 300),
                                  child: _showYes
                                      ? Text(
                                          'Yes',
                                          key: Key('Yes'),
                                          style: TextStyle(color: Colors.black),
                                        )
                                      : Text(
                                          'No',
                                          key: Key('No'),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (_showNo)
                      Container(
                        width: inputWidth + 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: inputWidth,
                              child: Text(
                                'Where is Your family located?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 240, 135, 170)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    hintStyle: TextStyle(color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.pink, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Country your family live in',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                icon: Icon(isDropdownOpened
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down),
                                items: country1
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: (item ==
                                                        'Frequently used Countries' ||
                                                    item == 'All Countries')
                                                ? TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black,
                                                  )
                                                : TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedCountry,
                                onChanged: (String? value) {
                                  setState(() {
                                    if (value != 'Frequently used Countries') {
                                      selectedCountry = value;
                                      checkfields();

                                      isDropdownOpened = false;
                                    }
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    isDropdownOpened = !isDropdownOpened;
                                  });
                                },
                                onSaved: (value) {
                                  setState(() {
                                    isDropdownOpened = false;
                                  });
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return country1.map<Widget>((String item) {
                                    return Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                print('print');
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 1500),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(0.0, 1.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;
                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return Indian_state(
                                        onSelectState: (state) {
                                          setState(() {
                                            this.selectedState = state;
                                            checkfields();
                                          });
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all()),
                                width: inputWidth,
                                height: 60,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    selectedState != null
                                        ? Text(selectedState!)
                                        : Text(
                                            'State your family live in'), // Render selected state if available, otherwise render default text
                                    //  Text(selectedState),
                                    //  SizedBox(width: 140,),
                                    // Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: inputWidth,
                      child: Text(
                        '''Your Family's Financial Status''',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color.fromARGB(255, 240, 135, 170)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: inputWidth,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selectFinanceSts == 'Elite'
                            ? Color.fromARGB(192, 226, 41, 28)
                            : Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        //selectFinanceSts
                      ),
                      child: RadioListTile(
                        title: Text(
                          'Elite',
                          style: TextStyle(
                              color: selectFinanceSts == 'Elite'
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        value: 'Elite',
                        groupValue: selectFinanceSts,
                        onChanged: (value) {
                          setState(() {
                            selectFinanceSts = value.toString();
                            checkfields();
                          });
                        },
                      ),
                    ),
                    if (selectFinanceSts == 'Elite')
                      Container(
                        width: inputWidth,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                            left: BorderSide(color: Colors.grey),
                            right: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.briefcase,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Exceptional professional or business background',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.home,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Property or other assets worth high value',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.indianRupeeSign,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Annual family income is more than 70 lakhs',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    // container high

                    Container(
                      width: inputWidth,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selectFinanceSts == 'High'
                            ? Color.fromARGB(192, 226, 41, 28)
                            : Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        //selectFinanceSts
                      ),
                      child: RadioListTile(
                        title: Text(
                          'High',
                          style: TextStyle(
                            color: selectFinanceSts == 'High'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        value: 'High',
                        groupValue: selectFinanceSts,
                        onChanged: (value) {
                          setState(() {
                            selectFinanceSts = value.toString();
                            checkfields();
                          });
                        },
                      ),
                    ),
                    if (selectFinanceSts == 'High')
                      Container(
                        width: inputWidth,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                            left: BorderSide(color: Colors.grey),
                            right: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.briefcase,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Leadership positions or owns a mid-sized business',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.home,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Property or other assets worth high value',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.indianRupeeSign,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Annual family income is 30-70 lakhs',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    //Middle
                    Container(
                      width: inputWidth,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selectFinanceSts == 'Middle'
                            ? Color.fromARGB(192, 226, 41, 28)
                            : Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        //selectFinanceSts
                      ),
                      child: RadioListTile(
                        title: Text(
                          'Middle',
                          style: TextStyle(
                              color: selectFinanceSts == 'Middle'
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        value: 'Middle',
                        groupValue: selectFinanceSts,
                        onChanged: (value) {
                          setState(() {
                            selectFinanceSts = value.toString();
                            checkfields();
                          });
                        },
                      ),
                    ),
                    if (selectFinanceSts == 'Middle')
                      Container(
                        width: inputWidth,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                            left: BorderSide(color: Colors.grey),
                            right: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.briefcase,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Salaried executive/office jobs or a small business',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.home,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'A vehicle,some assets,owned or rented houses',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.indianRupeeSign,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Annual family income is 10-30 lakhs',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    //Middle
                    Container(
                      width: inputWidth,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selectFinanceSts == 'Aspiring'
                            ? Color.fromARGB(192, 226, 41, 28)
                            : Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        //selectFinanceSts
                      ),
                      child: RadioListTile(
                        title: Text(
                          'Aspiring',
                          style: TextStyle(
                              color: selectFinanceSts == 'Aspiring'
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        value: 'Aspiring',
                        groupValue: selectFinanceSts,
                        onChanged: (value) {
                          setState(() {
                            selectFinanceSts = value.toString();
                            checkfields();
                          });
                        },
                      ),
                    ),
                    if (selectFinanceSts == 'Aspiring')
                      Container(
                        width: inputWidth,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                            left: BorderSide(color: Colors.grey),
                            right: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.briefcase,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Limited means currently,but is working towards a better lifestyle',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.indianRupeeSign,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Annual family income is up to 10 lakhs',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    SizedBox(
                      height: 30,
                    ),
                  ],
                );
              }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 100,
            right: 100,
            child: Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                onPressed: selectedfield
                    ? () {
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
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                child: Icon(Icons.forward,
                    size: 30,
                    color: selectedfield ? Colors.pink : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
