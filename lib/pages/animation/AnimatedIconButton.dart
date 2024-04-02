import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget
{
  final VoidCallback onPressed;
   const AnimatedIconButton({Key? key, required this.onPressed}) : super(key: key);
  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState()
  {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));
    animation =  Tween<double>(begin: 0, end: 1).animate(animationController);
    animation.addStatusListener((status) { 
      if(status == AnimationStatus.completed)
      {
         // Redirect to the next page after the animation completes
        widget.onPressed();
      }
    });
    animationController.forward();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context)
  {
    return  Container(
      width: 140,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.white,
        ),
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: animation.value * 2 * 3.141,
              child: Icon(
                Icons.forward,
                size: 30,
                color: Colors.pink,
              ),
            );
          },
        ),
      ),
    );
  }
}