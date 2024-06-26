import 'package:destinedknot/pages/variables.dart';
import 'package:flutter/material.dart';

import 'animation/textAnimation.dart';
import 'drawers/drawer_Your_Name.dart';

// ignore: camel_case_types
class frontPage extends StatefulWidget {
  const frontPage({super.key});
  @override
  State<frontPage> createState() => _frontPageState();
}

// ignore: camel_case_types
class _frontPageState extends State<frontPage> {
  int selectedContainerIndex = -1;
  int selectedContainerIndex1 = -1;

  Widget _buildDrawer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: your_name(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
    icon: Icon(Icons.arrow_back_sharp,color: Colors.pink,),
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double inputWidth = constraints.maxWidth - 20;
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      color: selectedContainerIndex == 0 ||
                              selectedContainerIndex == 1 ||
                              selectedContainerIndex == 2 ||
                              selectedContainerIndex == 3 ||
                              selectedContainerIndex == 4 ||
                              selectedContainerIndex == 5 ||
                              selectedContainerIndex == 6
                          ? Color.fromARGB(223, 0, 0, 0)
                          : Color.fromARGB(255, 240, 134, 169),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    size: 45,
                    //  color: Color.fromARGB(255, 238, 16, 90),
                    color: selectedContainerIndex == 0 ||
                            selectedContainerIndex == 1 ||
                            selectedContainerIndex == 2 ||
                            selectedContainerIndex == 3 ||
                            selectedContainerIndex == 4 ||
                            selectedContainerIndex == 5 ||
                            selectedContainerIndex == 6
                        ? Color.fromARGB(255, 245, 21, 5)
                        : Colors.pink,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 20),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 1.00,
                    child: buildMarquee(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          buildCheckboxContainer(0, 'Myself'),
                          buildCheckboxContainer(1, 'My Son'),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          buildCheckboxContainer(2, 'My Daughter'),
                          buildCheckboxContainer(3, 'My Brother'),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          buildCheckboxContainer(4, 'My Sister'),
                          buildCheckboxContainer(5, 'My Friend'),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          buildCheckboxContainer(6, 'My Relative'),
                        ],
                      ),
                      SizedBox(height: 8,),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                if (selectedContainerIndex == 0 ||
                    selectedContainerIndex == 5 ||
                    selectedContainerIndex == 6)
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Column(
                      children: [
                        Text(
                          'Your Gender',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color.fromARGB(255, 240, 135, 170)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildCheckboxContainer1(0, 'Male'),
                              SizedBox(
                                width: 10,
                              ),
                              buildCheckboxContainer1(1, 'Female'),
                            ],
                          ),
                           SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 140,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: ElevatedButton(
                            onPressed: selectedContainerIndex1 == 0 ||
                                    selectedContainerIndex1 == 1
                                ? () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return Scaffold(
                                            // Wrapping with Scaffold for app bar and other functionalities
                                            body: your_name(),
                                          );
                                        },
                                        transitionDuration:
                                            Duration(milliseconds: 1500),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          var begin = Offset(0.0, 1.0);
                                          var end = Offset.zero;
                                          var curve = Curves.easeOutQuart;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));
                                          var offsetAnimation =
                                              animation.drive(tween);

                                          return SlideTransition(
                                            position: offsetAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor: Colors.white,
                            ),
                            child: Icon(Icons.forward,
                                size: 30,
                                color: selectedContainerIndex1 == 0 ||
                                        selectedContainerIndex1 == 1
                                    ? Colors.pink
                                    : Color.fromARGB(223, 0, 0, 0)),
                          ),
                        )
                      ],
                    ),
                  ),
                if (selectedContainerIndex == 1 ||
                    selectedContainerIndex == 2 ||
                    selectedContainerIndex == 3 ||
                    selectedContainerIndex == 4)
                  Container(
                    width: 140,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: ElevatedButton(
                      onPressed: () {
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
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildCheckboxContainer(int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: [
            if (selectedContainerIndex == index)
              Checkbox(
                activeColor: Colors.red,
                checkColor: Colors.white,
                shape: const CircleBorder(),
                value: true,
                onChanged: (bool? value) {},
              ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckboxContainer1(int index1, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedContainerIndex1 = index1;
          if (index1 == 0) {
            selectedGender = 'Male';
          } else if (index1 == 1) {
            selectedGender = 'Female';
          }
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.40,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: [
            if (selectedContainerIndex1 == index1)
              Checkbox(
                activeColor: Colors.red,
                checkColor: Colors.white,
                shape: const CircleBorder(),
                value: true,
                onChanged: (bool? value) {},
              ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
