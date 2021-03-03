import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String apiKey = "&appid=cac6339199816858ad144b9e74585a0d&units=metric";
  final String url = "http://api.openweathermap.org/data/2.5/weather?q=";
  var temp;
  var min;
  var max;
  var iconDescription="";
  final myController = TextEditingController();
 String cityName="";
 String iconCode = "01n";
 void weatherData(String cityName) async{
  var searchResult = await http.get(url + cityName + apiKey);
  var result = json.decode(searchResult.body);
  if (result["cod"]=="404")
    {
        setState(() {
          cityName = "Wrong Input";
          temp = 0;
        });
    }
    
    else {
      setState(() {
        temp = result["main"]["temp"].round();
        iconCode = result["weather"][0]["icon"];
        min = result["main"]["temp_min"].round();
        max = result["main"]["temp_max"].round();
        //var a = result["weather"][0]["description"].split(" ");
        // for(var i=0;i<a.length;i++){
        //     print(a[i][0].toUpperCase()+a[i].substring(1));
          
        // }
        
        iconDescription = result["weather"][0]["description"];
        //print(iconDescription);
        
      });

    }

 }
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
                      controller: myController,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RaisedButton(
                    onPressed: ()=>weatherData(myController.text),
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
                        "http://openweathermap.org/img/wn/${iconCode}@2x.png"),
                    height: 80,
                    width: 80,
                  ),
                  Container(
                    child: Text(iconDescription),
                  ),
                  Container(
                    child: Text(temp.toString()),
                  ),
                  Container(
                    child: Row(children: [
                      Text(min.toString()),
                      Expanded(child: Divider()),
                      Text(max.toString()),
                    ],),
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
