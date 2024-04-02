import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

import 'familyFinance.dart';
import 'hobbiesInterest.dart';
import 'list/brotherlist.dart';
import 'list/familydetailsList.dart';
import 'list/fatherdetaillist.dart';
import 'list/sisterlist.dart';

class familyDetails extends StatefulWidget {
  @override
  State<familyDetails> createState() => _familyDetailsState();
}

class _familyDetailsState extends State<familyDetails> {
  bool isDialogOpen = false;
  bool anyfieldfilled = false;

  void checkFields()
  {
    if(selectedmotherStatus.isNotEmpty || selectedFatherStatus.isNotEmpty || selectedsisterStatus.isNotEmpty || selectedbrotherStatus.isNotEmpty)
    {
setState(() {
  anyfieldfilled = true;
});

    }
    else{
      setState(() {
         anyfieldfilled = false;
      });
    }
  }
void showMotherStatus() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        insetPadding: EdgeInsets.fromLTRB(28, 310, 28, 100),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300), // Adjust duration as needed
          curve: Curves.easeInOut, // Add your preferred curve
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white, // Assuming you want a white background color
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: familydetailsmother.map((option) {
              return ListTile(
                title: Text(option),
                
                onTap: () {
                  setState(() {
                    selectedmotherStatus = option;
                     checkFields();
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      );
    },
  ).then((_) {
    setState(() {
      isDialogOpen = false; // Dialog is closed
    });
  });
}

void showFatherStatus() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        insetPadding: EdgeInsets.fromLTRB(28, 400, 28, 20),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300), // Adjust duration as needed
          curve: Curves.easeInOut, // Add your preferred curve
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white, // Assuming you want a white background color
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: familydetailsfather.map((option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    
                    selectedFatherStatus = option;
                     checkFields();
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      );
    },
  ).then((_) {
    setState(() {
      isDialogOpen = false; // Dialog is closed
    });
  });
}

void showSisterStatus() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        insetPadding: EdgeInsets.fromLTRB(28, 40, 28, 320),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300), // Adjust duration as needed
          curve: Curves.easeInOut, // Add your preferred curve
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white, // Assuming you want a white background color
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: familydetailssister.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      
                      selectedsisterStatus = option;
                       checkFields();
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    },
  ).then((_) {
    setState(() {
      isDialogOpen = false; // Dialog is closed
    });
  });
}

void showBrotherStatus() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        insetPadding: EdgeInsets.fromLTRB(28, 130, 28, 250),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300), // Adjust duration as needed
          curve: Curves.easeInOut, // Add your preferred curve
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white, // Assuming you want a white background color
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: familydetailsbrother.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                       
                       selectedbrotherStatus = option;
                       checkFields();
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    },
  ).then((_) {
    setState(() {
      isDialogOpen = false; // Dialog is closed
    });
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
                MaterialPageRoute(builder: (context) => hobbiesInterest()));
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
                          color: Color.fromARGB(255, 132, 228, 191),
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
                  'Add family details',
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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                  isDialogOpen = true; 
                  });

                  showMotherStatus();
                },
                child: Container(
                    width: inputWidth,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              selectedmotherStatus.isNotEmpty
                                  ? selectedmotherStatus
                                  : '''Mother's details''',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        //Icon(Icons.arrow_drop_down)
                        IconButton(
                            onPressed: () {
                              showMotherStatus();
                            },
                            icon: isDialogOpen
                                ? Icon(Icons.arrow_drop_up)
                                : Icon(Icons.arrow_drop_down))
                      ],
                    )),
              ),
  SizedBox(
                height: 20,
              ),
                    InkWell(
                onTap: () {
                  setState(() {
                  isDialogOpen = true; 
                  });

                  showFatherStatus();
                },
                child: Container(
                    width: inputWidth,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              selectedFatherStatus.isNotEmpty
                                  ? selectedFatherStatus
                                  : '''Father's details''',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        //Icon(Icons.arrow_drop_down)
                        IconButton(
                            onPressed: () {
                              showFatherStatus();
                            },
                            icon: isDialogOpen
                                ? Icon(Icons.arrow_drop_up)
                                : Icon(Icons.arrow_drop_down))
                      ],
                    )),
              ),
                SizedBox(
                height: 20,
              ),

                             InkWell(
                onTap: () {
                  setState(() {
                  isDialogOpen = true; 
                  });

                  showSisterStatus();
                },
                child: Container(
                    width: inputWidth,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              selectedsisterStatus.isNotEmpty
                                  ? selectedsisterStatus
                                  : '''No. of sister's''',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        //Icon(Icons.arrow_drop_down)
                        IconButton(
                            onPressed: () {
                              showSisterStatus();
                            },
                            icon: isDialogOpen
                                ? Icon(Icons.arrow_drop_up)
                                : Icon(Icons.arrow_drop_down))
                      ],
                    )),
              ),

  SizedBox(
                height: 20,
              ),
              
                             InkWell(
                onTap: () {
                  setState(() {
                  isDialogOpen = true; 
                  });

                  showBrotherStatus();
                },
                child: Container(
                    width: inputWidth,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                               selectedbrotherStatus.isNotEmpty
                                  ?  selectedbrotherStatus
                                  : '''No. of brother's''',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        //Icon(Icons.arrow_drop_down)
                        IconButton(
                            onPressed: () {
                              showBrotherStatus();
                            },
                            icon: isDialogOpen
                                ? Icon(Icons.arrow_drop_up)
                                : Icon(Icons.arrow_drop_down))
                      ],
                    )),
              ),

                SizedBox(
                height: 30,
              ),

                    Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                onPressed: anyfieldfilled ? () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Scaffold(
                          // Wrapping with Scaffold for app bar and other functionalities
                          body: familyFinance(),
                        );
                      },
                      transitionDuration: Duration(milliseconds: 1500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(1.0, 0.0);
                        var end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
                child: Icon(Icons.forward, size: 30, color:  anyfieldfilled ? Colors.pink : Colors.black),
              ),
            ),
            ],
          ),
        ));
      }),
    );
  }
}
