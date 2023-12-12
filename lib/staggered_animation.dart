import 'dart:math';

import 'package:flutter/material.dart';

class SteggeredAnimation extends StatefulWidget {
  const SteggeredAnimation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SteggeredAnimation();
  }
}

class _SteggeredAnimation extends State<SteggeredAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationStarRotate;
  late Animation<double> _animationHeight;
  late Animation<double> _animationStarOpacity;
  late Animation<double> _animationHeightWhite;
  late Animation<double>_animationFieldsOpacity;
  late Animation<double>_animationScale;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..addListener(() {setState(() {
          
        });})
          ..addStatusListener((status) {
            setState(() {});
          });
    _animationStarRotate = Tween<double>(begin: 0, end: 2 * pi).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.2),
            reverseCurve: Curves.decelerate));
    _animationHeight = Tween<double>(begin: 0.0, end: 980).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.2),
            reverseCurve: Curves.decelerate));
    _animationStarOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.1, 0.2),
            reverseCurve: Curves.decelerate));
    _animationHeightWhite = Tween<double>(begin: 0.5, end: 350.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.25, 0.4),
            reverseCurve: Curves.decelerate));
     _animationFieldsOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 0.5),
            reverseCurve: Curves.decelerate));
     _animationScale = Tween<double>(begin: 0.0, end: pi*0.32).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 0.6),
            reverseCurve: Curves.decelerate));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: const Alignment(0, 1),
              child: Container(
                height: _animationHeight.value,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
              ),
            ),
             Align(alignment: Alignment.center,
               child: Opacity(
                    opacity: _animationStarOpacity.value,
                    child: Transform.rotate(
                        angle: _animationStarRotate.value,
                        alignment: Alignment.center,
                        origin: const Offset(0, 0),
                        child: IconButton(
                            onPressed: () {
                              _animationController.forward();
                            },
                            icon: const Icon(
                              Icons.star_border,
                              color: Colors.black,
                              size: 70,
                            ))),
                  ),
             ),
            Align(
              alignment: const Alignment(0, 1),
              child: Container(
                height: _animationHeightWhite.value,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                alignment: Alignment.topCenter,
                child: Opacity(opacity: _animationFieldsOpacity.value,
                  child: Transform(
                    transform: Matrix4.identity()..scale(_animationScale.value),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        SizedBox(
                            width: width * 0.7,
                            height: height * 0.07,
                            child: TextField(
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                  iconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.1),
                                  ),
                                  labelText: 'User Name',
                                  icon: const Icon(Icons.person)),
                            )),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        SizedBox(
                            width: width * 0.7,
                            height: height * 0.07,
                            child: TextField(
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                  iconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.1),
                                  ),
                                  labelText: 'password',
                                  icon: const Icon(Icons.password)),
                            )),
                            SizedBox(height: height*0.04,),
                            Row(
                              
                              children: [
                                SizedBox(width: width*0.25,),
                                ElevatedButton(onPressed: (){}, child: const Text('Login')),
                                SizedBox(width: width*0.18,),
                                ElevatedButton(onPressed: (){
                                  _animationController.reverse();
                                }, child: const Text('back')),
                
                
                              ],
                            )
                
                      
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
