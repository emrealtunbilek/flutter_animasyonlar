import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration.zero,
            to: Duration(milliseconds: 200),
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(milliseconds: 250),
            to: Duration(milliseconds: 500),
            tag: "width")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(milliseconds: 500),
            to: Duration(milliseconds: 750),
            tag: "height")
        .addAnimatable(
            animatable: EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 16),
                end: EdgeInsets.only(bottom: 75)),
            from: Duration(milliseconds: 750),
            to: Duration(milliseconds: 1000),
            curve: Curves.easeInCirc,
            tag: "padding")
        .addAnimatable(
            animatable: new BorderRadiusTween(
              begin: new BorderRadius.circular(4.0),
              end: new BorderRadius.circular(75.0),
            ),
            from: const Duration(milliseconds: 750),
            to: const Duration(milliseconds: 1000),
            curve: Curves.ease,
            tag: "borderRadius")
        .addAnimatable(
            animatable: new ColorTween(
              begin: Colors.indigo[100],
              end: Colors.orange[400],
            ),
            from: const Duration(milliseconds: 1000),
            to: const Duration(milliseconds: 1500),
            curve: Curves.ease,
            tag: "color")
        .animate(controller); //opacity için

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext contet, Widget child) {
              return Container(
                padding: sequenceAnimation["padding"].value,
                child: Opacity(
                  opacity: sequenceAnimation["opacity"].value,
                  child: Container(
                    decoration: BoxDecoration(
                        color: sequenceAnimation["color"].value,
                        border: Border.all(
                          width: 3,
                          color: Colors.pink[200],
                        ),
                        borderRadius: sequenceAnimation["borderRadius"].value),
                    width: sequenceAnimation["width"].value,
                    height: sequenceAnimation["height"].value,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
