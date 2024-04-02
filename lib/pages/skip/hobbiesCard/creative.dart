import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../animation/snackbarAnimation.dart';
import '../../variables.dart';
import '../iconslist/createIconlist.dart';

class creativeHobbies extends StatefulWidget {
  final Function(int) updateTotalCount;
  const creativeHobbies({Key? key, required this.updateTotalCount})
      : super(key: key);
  @override
  State<creativeHobbies> createState() => _creativeHobbiesState();
}

class _creativeHobbiesState extends State<creativeHobbies> {
  List<bool> containerSelected = List.generate(9, (index) => false);

  bool _extended = false;
  


  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double inputWidth = constraints.maxWidth - 20;
      return Container(
        height: _extended ? 280 : 210,
        width: inputWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.shade50, // Shadow color
              offset: Offset.zero, // Moves the shadow 2 pixels downwards
              blurRadius: 5, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: inputWidth - 50,
                  child: Center(child: Text('Creative')),
                ),
                for (int i = 0; i < 2; i++)
                  Row(
                    children: List.generate(
                        3,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    if (containerSelected[index + (i * 3)]) {
                                      containerSelected[index + (i * 3)] =
                                          false;
                                      selectedCreativeCount--;
                                      widget.updateTotalCount(
                                          selectedCreativeCount +
                                              selectedPersonalityCount +
                                              selectedSeriesCount);
                                    } else if (selectedCreativeCount < 3) {
                                      containerSelected[index + (i * 3)] = true;
                                      selectedCreativeCount++;
                                      widget.updateTotalCount(
                                          selectedCreativeCount +
                                              selectedPersonalityCount +
                                              selectedSeriesCount);
                                              showDialogbox(context,totalSelectCount,mainSelectCount);
            
                                    }
                                  },
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, bottom: 3),
                                child: Container(
                                  width: inputWidth / 3 - 10,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50),
                                    color: containerSelected[index + (i * 3)]
                                        ? Colors.pink
                                        : Colors
                                            .white, // Change color based on selected state
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        icons[index + (i * 3)],
                                        size: 15,
                                        color:
                                            containerSelected[index + (i * 3)]
                                                ? Colors.white
                                                : Colors.pink,
                                      ),
                                      Text(
                                        _getTextForIndex(index + (i * 3)),
                                        style: TextStyle(
                                          color:
                                              containerSelected[index + (i * 3)]
                                                  ? Colors.white
                                                  : Colors.pink,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
        
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _extended = !_extended;
                    });
                  },
                  child:
                      Center(child: Text(_extended ? 'View Less' : 'View All')),
                ),
                //if(selectedCount>3)

                if (_extended) ...[
                  SizedBox(height: 10),
                  // for (int i = 1; i < 3; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (containerSelected[index + 6]) {
                              containerSelected[index + 6] = false;
                              selectedCreativeCount--;
                              widget.updateTotalCount(selectedCreativeCount +
                                  selectedPersonalityCount +
                                  selectedSeriesCount);
                            } else if (selectedCreativeCount < 3) {
                              containerSelected[index + 6] = true;
                              selectedCreativeCount++;
                              widget.updateTotalCount(selectedCreativeCount +
                                  selectedPersonalityCount +
                                  selectedSeriesCount);
                                  showDialogbox(context,totalSelectCount,mainSelectCount);
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2, bottom: 3),
                          child: Container(
                            width: inputWidth / 3 - 10,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                              color: containerSelected[index + 6]
                                  ? Colors.pink
                                  : Colors
                                      .white, // Change color based on selected state
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(icons[index + 6],
                                    size: 15,
                                    color: containerSelected[index + 6]
                                        ? Colors.white
                                        : Colors.pink),
                                Text(
                                  _getTextForIndex(index + 6),
                                  style: TextStyle(
                                      color: containerSelected[index + 6]
                                          ? Colors.white
                                          : Colors.pink),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      );
    });
  }

  String _getTextForIndex(int index) {
    switch (index) {
      case 0:
        return 'Writing';
      case 1:
        return 'Cooking';
      case 2:
        return 'Singing';
      case 3:
        return 'Poetry';
      case 4:
        return 'Acting';
      case 5:
        return 'Painting';
      case 6:
        return 'Blogging';
      case 7:
        return 'Designing';
      case 8:
        return 'Doodling';
      case 9:
        return 'Gardening';
      default:
        return '';
    }
  }
}
