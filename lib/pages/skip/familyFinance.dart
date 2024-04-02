import 'package:flutter/material.dart';

import 'familyDetails.dart';

class familyFinance extends StatefulWidget {
  @override
  State<familyFinance> createState() => _familyFinanceState();
}

class _familyFinanceState extends State<familyFinance>
    with SingleTickerProviderStateMixin {
  bool isYesSelected = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSelection() {
    setState(() {
      isYesSelected = !isYesSelected;
    });
    if (isYesSelected) {
      _controller.forward(); // Slide to the "Yes" container
    } else {
      _controller.reverse(); // Slide back to the "No" container
    }
  }

  Widget build(BuildContext context) {
    return
/*
     Scaffold(
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
      body:      LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints )
                      {
                        double inputWidth = constraints.maxWidth - 50;
                        return SingleChildScrollView(child: Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      setState(() {
                        isYesSelected = true;
                      });


                    },
                    child: AnimatedContainer(
                       duration: Duration(milliseconds: 500),
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 45,
                             decoration: BoxDecoration(
                color: isYesSelected ? Colors.red : Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
                      child: Center(
                          child: Text('Yes',
                              style: TextStyle(color: Colors.black))),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isYesSelected = false;
                      });
                    },
                    child: AnimatedContainer(
                       duration: Duration(milliseconds: 500),
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 45,
                             decoration: BoxDecoration(
                color: !isYesSelected ? Colors.red : Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
                      child: Center(
                          child: Text('No',
                              style: TextStyle(color: Colors.black))),
                    ),
                  ),
                ],
              ),
            ),

                            ],
                          ),
                        ));
                      }),
    );
   
    */
        Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.pink),
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
                  SizedBox(height: 50),
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
                  SizedBox(height: 20),
              Container(
      width: MediaQuery.of(context).size.width * 0.687,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _toggleSelection();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    isYesSelected ? Colors.red : Colors.transparent,
                    isYesSelected ? Colors.transparent : Colors.red,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Yes',
                  style: TextStyle(color: isYesSelected ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
          InkWell(
            onTap: () {
              _toggleSelection();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    !isYesSelected ? Colors.red : Colors.transparent,
                    !isYesSelected ? Colors.transparent : Colors.red,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'No',
                  style: TextStyle(color: !isYesSelected ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
         
        ],
      ),
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
