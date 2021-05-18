import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class Down extends StatefulWidget {
  @override
  _DownState createState() => _DownState();
}

class _DownState extends State<Down> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画模拟"),
      ),
      body: Container(
          child: Wrap(
        children: [
          Gold(
            seconds: 4,
          ),
          Gold(
            seconds: 5,
          ),
          Gold(
            seconds: 2,
          ),
          Gold(
            seconds: 4,
          ),
          Gold(
            seconds: 6,
          ),
          Gold(
            seconds: 7,
          ),
          Gold(seconds: 2),
          Gold(seconds: 3),

          // Gold(),
          // Gold(),
        ],
      )),
    );
  }
}

class Gold extends StatefulWidget {
  final int seconds;
  Gold({this.seconds});
  @override
  _GoldState createState() => _GoldState();
}

class _GoldState extends State<Gold> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startFall();
  }

  void _startFall() {
    _controller = new AnimationController(
        vsync: this, duration: Duration(seconds: widget.seconds));
    // _controller.animateWith(GravitySimulation(
    //   10.0, // acceleration, pixels per second per second
    //   0.0, // starting position, pixels
    //   0, // ending position, pixels
    //   0.0, // starting velocity, pixels per second
    // ));
    _controller.forward();
    _controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('99999999999999');
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(50)),
                margin: EdgeInsets.only(top: _controller.value * 800),
                child: Center(
                  child:
                      Text('测试', style: TextStyle(fontWeight: FontWeight.bold)),
                ));
          },
        ));
  }
}
