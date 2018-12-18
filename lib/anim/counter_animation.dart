import 'package:flutter/material.dart';

class CounterAnimator extends StatefulWidget {
  @override
  _CounterAnimatorState createState() => _CounterAnimatorState();
}

class _CounterAnimatorState extends State<CounterAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  int _counter=0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 3),vsync: this);
    animation=new CurvedAnimation(parent: _controller,
    curve: Curves.easeIn);

    _controller.addListener((){
      this.setState(() {
              _counter++; 
              debugPrint("Counter: $_counter");  
            });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:new GestureDetector(
        child: Text(
          _controller.isAnimating?(_counter).toStringAsFixed(2):"Lets Begin",
          style: TextStyle(fontSize: 24.0*_controller.value+16.0),
        ),
        onTap: (){
          _controller.forward(from: 0.0);
        },
      )
    );
  }
}