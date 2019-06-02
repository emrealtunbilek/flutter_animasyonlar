import 'package:flutter/material.dart';

class AnimasyonluWidgetlar extends StatefulWidget {
  @override
  _AnimasyonluWidgetlarState createState() => _AnimasyonluWidgetlarState();
}

class _AnimasyonluWidgetlarState extends State<AnimasyonluWidgetlar> {
  var _color = Colors.pink;
  var _width = 200.0;
  var _height = 200.0;
  var _ilkCocukAktif = false;
  var _opacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animasyonlu Widgetlar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 2),
                height: _height,
                width: _width,
                color: _color,
              ),
              RaisedButton(
                onPressed: () {
                  _animatedContainerAnimasyonu();
                },
                color: Colors.blue,
                child: Text("Animated Container"),
              ),
              AnimatedCrossFade(
                firstChild: Image.network(
                    "https://i.ytimg.com/vi/05vEbwazBs0/hqdefault.jpg"),
                secondChild: Image.network(
                    "https://www.masalcisite.com/wp-content/uploads/bfi_thumb/car-33yvvk97uepc6lc8ru2r62.jpg"),
                crossFadeState: _ilkCocukAktif
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
              ),
              RaisedButton(
                onPressed: () {
                  _crossFadeAnimasyonu();
                },
                color: Colors.blue,
                child: Text("Cross Fade Animasyon"),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _opacityAnimasyonu();
                },
                color: Colors.blue,
                child: Text("Opacitiy Görünürlük Animasyon"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animatedContainerAnimasyonu() {
    setState(() {
      _color = _color == Colors.pink ? Colors.yellow : Colors.pink;
      _width = _width == 200.0 ? 300 : 200;
      _height = _height == 200 ? 300 : 200;
    });
  }

  void _crossFadeAnimasyonu() {
    setState(() {
      _ilkCocukAktif = !_ilkCocukAktif;
    });
  }

  void _opacityAnimasyonu() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.5 : 1.0;
    });
  }
}
