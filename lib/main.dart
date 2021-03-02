import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   accentColor: Colors.amber,
      //   canvasColor: Color.fromRGBO(255, 254, 229, 1),
      //   textTheme: ThemeData.light().textTheme.copyWith(
      //         bodyText1: TextStyle(
      //           color: Color.fromRGBO(20, 51, 51, 1),
      //         ),
      //         bodyText2: TextStyle(
      //           color: Color.fromRGBO(20, 51, 51, 1),
      //         ),
      //         headline6: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      // ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Enter City'),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Go'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/225px-Wikipedia-logo-v2.svg.png'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
