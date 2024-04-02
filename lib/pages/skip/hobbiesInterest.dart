import 'dart:async';

import 'package:flutter/material.dart';

import '../variables.dart';
import 'familyDetails.dart';
import 'hobbiesCard/creative.dart';
import 'hobbiesCard/personality.dart';
import 'hobbiesCard/series.dart';

class hobbiesInterest extends StatefulWidget {
  @override
  State<hobbiesInterest> createState() => _hobbiesInterestState();
}

class _hobbiesInterestState extends State<hobbiesInterest>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  bool _isIconRotating = false;

  List<bool> containerSelected = List.generate(9, (index) => false);

  int _colorIndex = 0;
  final List<Color> _iconColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];
  bool extended = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    _timer = Timer(Duration(seconds: 10), () {
      setState(() {
        _isIconRotating = false;
      });
    });

    setState(() {
      _isIconRotating = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  Color _getNextColor() {
    final nextColorIndex = (_colorIndex + 1) % _iconColors.length;
    setState(() {
      _colorIndex = nextColorIndex;
    });
    return _iconColors[nextColorIndex];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Destined',
                      style: TextStyle(color: Colors.red),
                    ),
                    _isIconRotating
                        ? RotationTransition(
                            turns: _controller,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                color: _getNextColor(),
                              ),
                              child: Icon(
                                Icons.all_inclusive,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Icon(
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
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double inputWidth = constraints.maxWidth - 20;
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '''Now let's add''',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 240, 135, 170)),
                          ),
                          Text(
                            '''Your hobbies & interests''',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 240, 135, 170)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '''This will help find better Matches''',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          creativeHobbies(
                            updateTotalCount: (count) {
                              setState(() {
                                totalSelectCount = count;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          personality(
                            updateTotalCount: (count) {
                              setState(() {
                                totalSelectCount = count;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          seriesWatch(
                            updateTotalCount: (count) {
                              setState(() {
                                totalSelectCount = count;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }, childCount: 1))
            ],
          )),
       
          
          InkWell(
  onTap: () {
    if (totalSelectCount == mainSelectCount) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => familyDetails(),
          transitionDuration: Duration(milliseconds: 1500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
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
    }
  },
  child: Container(
    width: MediaQuery.of(context).size.width * 0.43,
    height: 45,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
    ),
    margin: EdgeInsets.only(bottom: 20),
    child: Center(
      child: Text(
        'Continue ${totalSelectCount}/${mainSelectCount}',
        style: TextStyle(color: Colors.pink),
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}
