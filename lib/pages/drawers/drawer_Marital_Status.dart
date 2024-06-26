import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../list/children.dart';
import '../list/diet.dart';
import '../list/height.dart';
import '../list/marital.dart';
import 'drawer_Qualification.dart';
import 'drawer_Your_Profile.dart';

class maritalStatus extends StatefulWidget {
  @override
  State<maritalStatus> createState() => _maritalStatusState();
}
class _maritalStatusState extends State<maritalStatus> {

  void showMaritalStatusOption() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      //    insetPadding: EdgeInsets.fromLTRB(28, 220, 28, 200),
        insetPadding: EdgeInsets.fromLTRB(28, 220, 28, 200),
          child: Container(
          
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: marital.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      selectedMaritalStatus = option;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void showChildrenOption1()
  {
    showDialog(context: context, builder: (BuildContext context)
    {
      return Dialog(
          insetPadding: EdgeInsets.fromLTRB(28, 120, 28, 470),
        child: Container(
          child: Column(
            children: children1.map((option)
            {
              return ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    selectOption1 = option;
                  });
                   Navigator.pop(context);
                  
                },
              );
            } ).toList(),
          ),
        ),

      );

    });
  }


  void showChildrenOption2()
  {
    showDialog(context: context, builder: (BuildContext context)
    {
      return Dialog(
         insetPadding: EdgeInsets.fromLTRB(28, 190, 28, 340),
        child: Container(
          child: Column(
            children: children2.map((option)
            {
              return ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    selectOption2 = option;
                  });
                   Navigator.pop(context);
                },
              );
            } ).toList(),
          ),
        ),
      );
    });
  }

  void showHeightOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            insetPadding: EdgeInsets.fromLTRB(28, 400, 28, 50),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: height.map((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          selectedHeight = option;
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


  void showDietOption()
  {
    showDialog(context: context, builder: (BuildContext context)
    {
      return Dialog(
          insetPadding: EdgeInsets.fromLTRB(28, 100, 28,240),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: diet.map((option)
            {
              return ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    selectedDiet = option;
                  });
                    Navigator.pop(context);
                },

              );
              
            }).toList()
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
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  your_profile()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:
       
      LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
         double inputWidth = constraints.maxWidth-50;
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
                        color: Color.fromARGB(197, 221, 203, 241),
                        shape: BoxShape.circle),
                    child: Stack(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 18, left: 5),
                          child: Icon(
                            Icons.person,
                            //  size: 45,
                            size: 43,
                            color: Color.fromARGB(197, 120, 80, 165),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25, left: 45),
                          child: Icon(
                            FontAwesomeIcons.chartColumn,
                            //  size: 45,
                            size: 30,
                            color: Color.fromARGB(197, 120, 80, 165),
                          ),
                        ),
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
                      'Marital status',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 240, 135, 170)),
                    ),
              ),
            
                SizedBox(
                  height: 20,
                ),
        
   InkWell(
    onTap: () => showMaritalStatusOption(),
     child: Container(
            width: inputWidth,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: selectedMaritalStatus.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            selectedMaritalStatus.isNotEmpty
                                ? selectedMaritalStatus
                                : 'Your Marital status',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
   
        ),
   ),
  
  


               
                const SizedBox(
                  height: 20,
                ),

                if(selectedMaritalStatus == 'Divorced' || selectedMaritalStatus == 'Widowed' ||
                  selectedMaritalStatus == 'Awaiting Divorce' || selectedMaritalStatus == 'Annulled'
                )
                     Column(
                       children: [
                    Container(
                      width: inputWidth,
                      child: Text(
                      'Children',
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
 onTap: showChildrenOption1,
     child: Container(
            width: inputWidth,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: selectOption1.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child:Text(selectOption1.isNotEmpty ? selectOption1 : 'Do you have any children?'),
                        ),
                      )
   
        ),
   ),
  
                
                  const SizedBox(
                  height: 20,
                ),
                       ],
                     ),
                

          
          
                  if(selectOption1 == 'Yes,Living together' || selectOption1 == 'Yes, Not living together')
                     Column(
                       children: [
                   Container(
                    width: inputWidth,
                     child: Text(
                      'No of children',
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
 onTap: showChildrenOption2,
     child: Container(
            width: inputWidth,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: selectOption2.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(selectOption2.isNotEmpty ? selectOption2 : 'No. of children?'),
                        ),
                      )
   
        ),
   ),
  


           
                       const SizedBox(
                  height: 20,
                ),

                       ],
                     ),
                  
              

         





                    Container(
                      width: inputWidth,
                      child: Text(
                      'Height',
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
 onTap: showHeightOption,
     child: Container(
            width: inputWidth,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: selectedHeight.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                              child: Text(selectedHeight.isNotEmpty
                            ? selectedHeight
                            : 'Your height'),
                        ),
                      )
   
        ),
   ),
                    const SizedBox(
                  height: 30,
                ),

                  Container(
                    width: inputWidth,
                    child: Text(
                      'Diet',
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
  onTap: showDietOption,
     child: Container(
            width: inputWidth,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: selectedDiet.isNotEmpty ? Colors.pink : Colors.grey,width: 2)),
                            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                               child: Text(selectedDiet.isNotEmpty ? selectedDiet : 'Your diet'),
                        ),
                      )
   
        ),
   ),
        
                        const SizedBox(
                  height: 30,
                ),


                       Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Scaffold(
                          // Wrapping with Scaffold for app bar and other functionalities
                          body: your_Qualification(),
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
}