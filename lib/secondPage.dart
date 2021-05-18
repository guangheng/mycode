import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_drag_scale/flutter_drag_scale.dart';
import 'package:photo_view/photo_view.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("恭喜发财")),
        body: Center(
          child: Container(
            child: Gxfc(),
          ),
        ));
  }
}

class Gxfc extends StatefulWidget {
  @override
  _GxfcState createState() => _GxfcState();
}

class _GxfcState extends State<Gxfc> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween<double>(begin: 0.0, end: 500).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    // controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: animation.value),
        width: 10,
        height: 10,
        //  child: FlutterLogo(),
      ),
    );
  }
}
