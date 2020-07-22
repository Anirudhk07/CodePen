import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(children: <Widget>[
         SizedBox(height:100),
          
          Center(child: Container(
            height :500,
            
         child: Stack(
            
            children: <Widget>[
            Positioned(
              child :Container(
                
              height: 280,
              child: Image.network(
                'https://i.ibb.co/WPsVbsh/icecrema2-removebg-preview.png',
                fit: BoxFit.contain,
              ),
            ),),
            Positioned(
             right :85,
              
              
              top :130,
              child: Image.network(
                'https://i.ibb.co/RhVYND8/icecrema3-removebg-preview.png',
                fit: BoxFit.contain,
              ),
            ),
          ])
        ))],),
      ),
    );
  }
}
