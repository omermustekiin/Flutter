import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 18),
                    ),
                  ), //question
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 18),
                      )) //answer
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //0 indexli Delete Button
                    if (index == 0) {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white);
                    }
                    //1 indexli Del Button
                    else if (index == 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }

                    //Equal Button
                    else if (index == buttons.length - 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                      );
                    }

                    //Kalan Butonlar
                    else {
                      return MyButton(
                        //isOperator fonksiyonumu kullanarak butonların renklerini ayarladım
                        buttonTapped: () {
                          //basılan butonun ne oldugunu ekrana getırır
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
