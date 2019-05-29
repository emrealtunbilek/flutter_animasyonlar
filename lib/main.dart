import 'package:flutter/material.dart';

import 'new_page.dart';

void main() => runApp(MyApp());

//1- Ticker =>
//2- Animation
//3- AnimationController
//4- tween -> between(baslangıc - bitis) ,, curve

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController controller;
  Animation animation;
  Animation animation2;
  Animation animation3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    controller.addListener(() {
      setState(() {
        //debugPrint(controller.value.toString());
        //debugPrint(animation.value.toString());
      });
    });

    animation =
        ColorTween(begin: Colors.red, end: Colors.yellow).animate(controller);

    animation3 =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);

    animation2 = AlignmentTween(begin: Alignment(-1, 1), end: Alignment(1, -1))
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo));

    //controller.reverse(from: 100);
    controller.forward();
    controller.addStatusListener((durum) {
      if (durum == AnimationStatus.completed) {
        controller.reverse().orCancel;
      } else if (durum == AnimationStatus.dismissed) {
        controller.forward().orCancel;
      }

      debugPrint("Durum : " + durum.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: animation3.value * 20),
            ),
            Container(
              alignment: animation2.value,
              height: 100,
              child: Text(
                '$_counter', //+ '    %${controller.value.round()}',
                style: TextStyle(fontSize: controller.value + 20),
              ),
            ),
            Hero(
              tag: 'emre',
              child: FlutterLogo(
                size: 64,
                colors: Colors.purple,
              ),
            ),
            RaisedButton(
              child: Text("Next Page"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewPage()));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
