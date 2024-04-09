import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_decoration/icon_decoration.dart';

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

  bool _showYes = true;
  bool _showNo = false;

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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double inputWidth = constraints.maxWidth - 50;
        return SingleChildScrollView(
            child: Container(
          child: Column(
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
                                border:
                                    IconBorder(color: Colors.white, width: 3)),
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
                            width: MediaQuery.of(context).size.width * 0.27,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
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
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  //selectFinanceSts
                ),
                child: RadioListTile(
                  title: Text('Elite'),
                  value: 'Elite',
                  groupValue: selectFinanceSts,
                  onChanged: (value) {
                    setState(() {
                      selectFinanceSts = value.toString();
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
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  //selectFinanceSts
                ),
                child: RadioListTile(
                  title: Text('High'),
                  value: 'High',
                  groupValue: selectFinanceSts,
                  onChanged: (value) {
                    setState(() {
                      selectFinanceSts = value.toString();
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
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  //selectFinanceSts
                ),
                child: RadioListTile(
                  title: Text('Middle'),
                  value: 'Middle',
                  groupValue: selectFinanceSts,
                  onChanged: (value) {
                    setState(() {
                      selectFinanceSts = value.toString();
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
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  //selectFinanceSts
                ),
                child: RadioListTile(
                  title: Text('Aspiring'),
                  value: 'Aspiring',
                  groupValue: selectFinanceSts,
                  onChanged: (value) {
                    setState(() {
                      selectFinanceSts = value.toString();
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
            ],
          ),
        ));
      }),
    );
  }
}
/*
import 'package:flutter/material.dart';

import 'familyDetails.dart';

class familyFinance extends StatefulWidget {
  @override
  State<familyFinance> createState() => _familyFinanceState();
}

class _familyFinanceState extends State<familyFinance>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  bool _showYes = true;
  bool _showNo = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double inputWidth = constraints.maxWidth - 50;
        return SingleChildScrollView(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: inputWidth,
                  //   color: Colors.amber,
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
                              width: MediaQuery.of(context).size.width * 0.27,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
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
                            border: Border.all(color: Colors.grey),
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
/*
                Text( _controller.status == AnimationStatus.forward
                                      ? 'Yes'
                                      : 'No',
                                  style: TextStyle(color: Colors.black),),
                                  */
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
      }),
    );
  }
}
*/