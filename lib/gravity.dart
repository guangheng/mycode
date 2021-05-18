import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/physics.dart';
import 'dart:math';

class PhysicsAnimation extends StatefulWidget {
  _PhysicsAnimation createState() => _PhysicsAnimation();
}

class _PhysicsAnimation extends State<PhysicsAnimation>
    with TickerProviderStateMixin {
  AnimationController controller;
  GravitySimulation simulation;
  List<Widget> particles = [];
  bool isLoad = true;

  Random random = new Random();
  @override
  void initState() {
    super.initState();

    simulation = GravitySimulation(
      100, // acceleration
      0.0, // starting point
      2000.0, // end point
      5, // starting velocity
    );

    controller = AnimationController(vsync: this, upperBound: 500)
      ..addListener(() {
        setState(() {});
      });

    controller.animateWith(simulation);
    //controller.forward();
  }

  List<Widget> buildChild() {
    List<Widget> particles = [];

    for (int i = 0; i < 20; i++) {
      particles.add(Positioned(
          left: double.parse((i + 15).toString()),
          top: controller.value,
          height: 15,
          width: 15,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(15)),
          )));
    }
    return particles;
  }

  @override
  Widget build(BuildContext context) {
    isLoad = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("自由落体"),
      ),
      body: Stack(children: [
        ...buildChild(),
        Positioned(
            left: 50,
            top: controller.value,
            height: 15,
            width: 15,
            child: Container(color: Colors.redAccent))
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
