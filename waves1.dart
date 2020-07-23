import 'package:flutter/material.dart';

final appHeight = 650.0;
final appWidth = 350.0;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: MyAnimation()));
  }
}

class MyClipPath extends AnimatedWidget {
  final Animation<double> animation;

  MyClipPath(this.animation) : super(listenable: animation);

  final Color backgroundColor = Color(0x77899F);

  @override
  
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        color: Colors.white,
                        width: appWidth,
                        height: appHeight,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                            Text(
                              'Hang on a sec..',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 30.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      'It seems you are in the middle of the ocean'),
                                  SizedBox(
                                    height: 200,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(children: [
                                Positioned(
                                  bottom: 50,
                                  right: animation.value,
                                  child: ClipPath(
                                    clipper: BottomWaveClipper(),
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: Container(
                                        color: Color(0xFF104891),
                                        width: 1000,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  left: animation.value,
                                  child: ClipPath(
                                    clipper: BottomWaveClipper(),
                                    child: Opacity(
                                      opacity: 1,
                                      child: Container(
                                        color: Color(0xFF0a2e5c),
                                        width: 1000,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ))
                  ])
            ]));
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, 80.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 80.0);

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 80.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 2500), vsync: this)
          ..repeat(reverse: true);

    animation = Tween<double>(begin: -199, end: -1).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyClipPath(animation);
  }
}
