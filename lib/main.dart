import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CalculatorButtons(),
          ),
        ),
      ),
    );
  }
}

class CalculatorButtons extends StatefulWidget {
  @override
  _CalculatorButtonsState createState() => _CalculatorButtonsState();
}

class _CalculatorButtonsState extends State<CalculatorButtons> {
  String number = '';
  String action1 = '';
  String action2 = '';
  double answer = 0;
  double x = 0;
  double y;

  Widget button(String num, double numb) =>
      Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            child: Transform.rotate(
              angle: numb,
              child: FlatButton(
                splashColor: Colors.red,
                color: Colors.deepOrangeAccent,
                child: Transform.rotate(
                  angle: -numb,
                  child: Text(num, style: TextStyle(fontSize: 25.0)),
                ),
                onPressed: () {
                  setState(() {
                    if (num == '=' ||
                        num == '+' ||
                        num == '-' ||
                        num == '/' ||
                        num == '*') {
                      if (num == '+') {
                        if (action1 == '') {
                          action1 = 'Add';
                        } else {
                          action2 = 'Add';
                        }
                      } else if (num == '-') {
                        if (action1 == '') {
                          action1 = 'Subtract';
                        } else {
                          action2 = 'Subtract';
                        }
                      } else if (num == '/') {
                        if (action1 == '') {
                          action1 = 'Divide';
                        } else {
                          action2 = 'Divide';
                        }
                      } else if (num == '*') {
                        if (action1 == '') {
                          action1 = 'Multiply';
                        } else {
                          action2 = 'Multiply';
                        }
                      } else if (num == '=') {
                        if (action1 == '') {
                          action1 = 'Equals';
                        } else {
                          action2 = 'Equals';
                        }
                      }

                      if (x == 0) {
                        if (number != '') {
                          x = double.tryParse(number);
                          number = '';
                        }
                      } else {
                        y = double.tryParse(number);
                        if (action1 == 'Subtract') {
                          x -= y;
                          if (action2 != '') {
                            action1 = action2;
                            action2 = '';
                          }
                        } else if (action1 == 'Add') {
                          x += y;
                          if (action2 != '') {
                            action1 = action2;
                            action2 = '';
                          }
                        } else if (action1 == 'Divide') {
                          x /= y;
                          if (action2 != '') {
                            action1 = action2;
                            action2 = '';
                          }
                        } else if (action1 == 'Multiply') {
                          x *= y;
                          if (action2 != '') {
                            action1 = action2;
                            action2 = '';
                          }
                        } else if (action1 == 'Equals') {
                          if (action2 != '=' && action2 != '') {
                            action1 = action2;
                            action2 = '';
                          }
                        }
                        number = '';
                      }
                    }
                    if (num != '*' &&
                        num != '/' &&
                        num != '=' &&
                        num != '-' &&
                        num != '+') {
                      number += num;
                    }
                    answer = x;
                  });
                },
              ),
            ),
          ),
        ),
      );

  Widget customRow(String n1, String n2, String n3, String n4) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          button(n1, 25),
          button(n2, 16),
          button(n3, 25),
          button(n4, 16),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  number,
                  style: TextStyle(fontSize: 35.0, color: Colors.white),
                ),
                Text(
                  answer.toString(),
                  style: TextStyle(fontSize: 35.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Transform.rotate(
                    angle: 25.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      child: Transform.rotate(
                        angle: -25,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.deepOrangeAccent,
                          child: Text(
                            action1,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Transform.rotate(
                    angle: 25.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      child: Transform.rotate(
                        angle: -25,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              answer = 0;
                              x = 0;
                              y = 0;
                              number = '';
                              action1 = '';
                              action2 = '';
                            });
                          },
                          color: Colors.red,
                          child: Text(
                            'AC',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    child: Transform.rotate(
                      angle: 16.0,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            number = number.substring(0, number.length - 1);
                          });
                        },
                        color: Colors.white70,
                        child: Transform.rotate(
                          angle: -16,
                          child: Text(
                            'C',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: customRow('1', '2', '3', '/'),
        ),
        Expanded(
          child: customRow('4', '5', '6', '*'),
        ),
        Expanded(
          child: customRow('7', '8', '9', '-'),
        ),
        Expanded(
          child: customRow('.', '0', '+', '='),
        ),
      ],
    );
  }
}
