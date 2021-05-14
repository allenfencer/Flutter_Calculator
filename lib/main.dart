import 'package:flutter/material.dart';
import 'package:flutter_calculator/button_widget.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String history='0';
  String expression;
  String result='0';

  void buttonOnClick(String btnValue) {
    setState(() {

      if(btnValue=='AC')
      {
        history='0';
        result='0';
      }
      else if(btnValue=='C')
      {
        history=history.substring(0,history.length-1);
        if(history=='')
          {
            history='0';
          }
      }
      else if(btnValue=='=')
      {

        expression=history;

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result= '${exp.evaluate(EvaluationType.REAL, cm)}';
        }
        catch(e){
          result='Error';
        }

      }
      else{
        if(history=='0')
        {
          history=btnValue;
        }
        else {
          history = (history + btnValue);
        }
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
        centerTitle: true,
        elevation: 30,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              color: Colors.black,
              child: Text(history,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),

            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              color: Colors.black,
              child: Text(result,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(text: 'AC',fillColor: Colors.black,textColor: Colors.white,textSize: 28,callback: buttonOnClick),
              button(text: 'C',fillColor: Colors.black,textColor: Colors.white,textSize: 28,callback: buttonOnClick),
              button(text: '%',fillColor: Colors.black,textColor: Colors.white,textSize: 28,callback: buttonOnClick),
              button(text: '/',fillColor: Colors.blue,textColor: Colors.white,textSize: 28,callback: buttonOnClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(text: '7',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '8',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '9',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '*',fillColor: Colors.blue,textColor: Colors.white,textSize: 30,callback: buttonOnClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(text: '4',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '5',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback:buttonOnClick),
              button(text: '6',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '-',fillColor: Colors.blue,textColor: Colors.white,textSize: 30,callback: buttonOnClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(text: '1',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '2',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '3',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '+',fillColor: Colors.blue,textColor: Colors.white,textSize: 30,callback: buttonOnClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(text: '.',fillColor: Colors.black,textColor: Colors.white,textSize: 40,callback: buttonOnClick),
              button(text: '0',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '00',fillColor: Colors.black,textColor: Colors.white,textSize: 25,callback: buttonOnClick),
              button(text: '=',fillColor: Colors.blue,textColor: Colors.white,textSize: 30,callback: buttonOnClick),
            ],
          ),
        ],
      ),
    );
  }
}
