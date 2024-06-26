import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../list/income.dart';
import '../list/work.dart';
import 'drawer_About_Yourself.dart';
import 'drawer_Qualification.dart';

class your_Income extends StatefulWidget {
  @override
  State<your_Income> createState() => _your_IncomeState();
}

class _your_IncomeState extends State<your_Income> with TickerProviderStateMixin {
  Color iconColor = Colors.grey;
late AnimationController _controller;
late Animation<double> _animation;

void initState()
{
  super.initState();
  _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
  _animation = Tween<double>(begin: 0.0, end: 0.8).animate(_controller);
  _controller.forward();
}

  void showIncomeOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.fromLTRB(28, 330, 28, 0),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: income.map((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          selectedIncome = option;
                        });
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        });
  }

  void showWorkTypeOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.fromLTRB(28, 160, 28, 310),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: Worktype.map((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          selectedWorkType = option;
                        });
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        });
  }

  void showWorkAsOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.fromLTRB(28, 0, 28, 220),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: WorkAs.map((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          selectedWorkAs = option;
                        });
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
         leading: IconButton(
    icon: Icon(Icons.arrow_back_sharp,color: Colors.pink,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  your_Qualification()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:
      Column(
        children: [
       SizedBox(
  height: 4,
  child: AnimatedBuilder(
    animation: _controller,
    builder: (context, _) {
      return Row(
        children: [
          Expanded(
            flex: (_animation.value * 100).toInt(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 74, 154, 211), Color.fromARGB(255, 30, 212, 143),], // Change this to your desired colors
                  stops: [0.4, 1.0], // Stops at 40% and 100% of the screen width
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          Expanded(
            flex: ((1 - _animation.value) * 100).toInt(),
            child: Container(),
          ),
        ],
      );
    },
  ),
),

              Expanded(
                child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth - 50;
                      return SingleChildScrollView(
                        child: Container(
                          child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 201, 233, 220),
                          // border: Border.all(color: Colors.pink),
              
                          shape: BoxShape.circle),
                      child: Icon(
                        FontAwesomeIcons.briefcase,
                        //  size: 45,
                        size: 40,
                        color: Color.fromARGB(255, 30, 212, 143),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 35),
                    child: Text(
                      'You are almost done!',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 240, 135, 170)),
                    ),
                  ),
              
                  const SizedBox(
                    height: 50,
                  ),
                           Container(
                width: inputWidth,
                 child: Text(
                        'Income',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 240, 135, 170)),
                      ),
                           ),
                
                  const SizedBox(
                    height: 20,
                  ),
              
                  InkWell(
                    onTap: showIncomeOption,
                    child: Container(
                        width: inputWidth,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: selectedIncome.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(selectedIncome.isNotEmpty
                                ? selectedIncome
                                : 'Your anuual income'),
                          ),
                        )),
                  ),
              
              
                  Container(
                    width: inputWidth,
                    height: 30,
                    child: Row(
                      children: [
                        Text('Why is income required?'),
                        SizedBox(
                          width: 4,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                iconColor = Colors.red;
                              });
              
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    insetPadding:
                                        EdgeInsets.fromLTRB(80, 350, 70, 320),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(237, 32, 28, 28),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 15, bottom: 10),
                                        child: Text(
                                          '''Your income will be used for matchmaking. You can hide your income from others using Privacy Settings''',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) {
                                setState(() {
                                  iconColor = Colors.grey;
                                });
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.circleQuestion,
                              size: 20,
                              color: iconColor,
                            ))
                      ],
                    ),
                  ),
              
                  const SizedBox(
                    height: 50,
                  ),
                           Container(
                width: inputWidth,
                 child: Text(
                        'Work details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 240, 135, 170)),
                      ),
                           ),
                          
                  const SizedBox(
                    height: 20,
                  ),
              
                  InkWell(
                    onTap: showWorkTypeOption,
                    child: Container(
                        width: inputWidth,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: selectedWorkType.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(selectedWorkType.isNotEmpty
                                ? selectedWorkType
                                : 'You work with'),
                          ),
                        )),
                  ),
              
              
                  const SizedBox(
                    height: 20,
                  ),
              
                  InkWell(
                      onTap: showWorkAsOption,
                      child: Container(
                        width: inputWidth,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: selectedWorkAs.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(selectedWorkAs.isNotEmpty
                                ? selectedWorkAs
                                : 'You work as'),
                          ),
                        ),
                      )),
              
                  const SizedBox(
                    height: 20,
                  ),
                  //   if(selectedWorkType.isNotEmpty)
                  if (selectedWorkType == 'Private Company' ||
                      selectedWorkType == 'Government / Public Sector' ||
                      selectedWorkType == 'Defense / Civil Services' ||
                      selectedWorkType == 'Business / Self Employed')
                    Container(
                      width: inputWidth,
                      child: TextFormField(
                        //    controller: emailController,
                        //   onChanged: (value) => checkFields(),
                        validator: (String? name) {
                          if (name!.isEmpty) {
                            return "Please enter a company name";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            labelText: "Your current company name",
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pink,
                                    width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  const SizedBox(
                    height: 5,
                  ),
              
                  if (selectedWorkType == 'Private Company' ||
                      selectedWorkType == 'Government / Public Sector')
                    Container(
                      width: inputWidth,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text('specifiy current organization'),
                      ),
                    ),
                  if (selectedWorkType == 'Defense / Civil Services')
                    Container(
                      width: inputWidth,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text('E.g. Indian army, Indiann Air Force'),
                      ),
                    ),
              
                  if (selectedWorkType == 'Business / Self Employed')
                    Container(
                      width: inputWidth,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text('E.g. retail jewellers, tech business '),
                      ),
                    ),
              
                  const SizedBox(
                    height: 40,
                  ),
              
                  Container(
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
                                body: about_Yourself(),
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
                                    .chain(
                                        CurveTween(curve: Curves.easeOutQuart))),
                                child: child,
                                // position: offsetAnimation,
                                // child: child,
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
              
                  const SizedBox(
                    height: 20,
                  ),
                ],
                          ),
                        ),
                      );
                    }),
              ),
        ],
      )
      
   
    );
  }
}

