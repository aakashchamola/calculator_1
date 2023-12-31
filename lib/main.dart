import 'dart:math';

import 'package:calculator_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //variables
  var input = "";
  var output = "";
  var operation = "";
  var hideInput = false;
  var outputSize = 34.0;
  onButtonClick(value) {
    // if (input.length > 12) {
    //   if (input.contains('-') ||
    //       input.contains('X') ||
    //       input.contains('/') ||
    //       input.contains('+')) {
    //   } else {
    //     var b = input.substring(0, 12);
    //     input = b;
    //   }
    // }
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "<") {
      if (input.isNotEmpty) {
        //   if (input.length == 13) {
        //     input = input.substring(0, input.length);
        //   } else {
        //     input = input.substring(0, input.length - 1);
        //   }
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if ((input.endsWith("+") ||
          input.endsWith("-") ||
          input.endsWith("/") ||
          input.endsWith("*"))) {
        input = input.substring(0, input.length - 1);
      }
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = userInput.replaceAll("X", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        // if (output.contains(".")) {
        //   // var b;
        //   // var a = b.length(output.substring(-1, output.indexOf('.')));
        //   // if (a > 5) {
        //   //   output = output.substring(0, output.indexOf('.') + 5);
        //   //   final snackBar = SnackBar(
        //   //     content: const Text('Answer is Only Upto 5 Decimal Places'),
        //   //     action: SnackBarAction(
        //   //       label: 'Ok',
        //   //       onPressed: () {
        //   //         // Some code to undo the change.
        //   //       },
        //   //     ),
        //   //   );
        //   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //   // } else {
        //   //   output = finalValue.toString();
        //   // }
        // }
        hideInput = true;
        outputSize = 50;
        if (output.isNotEmpty) {
          input = output;
          if (value == "+" || value == "-" || value == "/" || value == "*") {
            hideInput = false;
            input = output + value;
          } else {
            input = '';
          }
        }
      }
    } else {
      if (input.endsWith("+") ||
          input.endsWith("-") ||
          input.endsWith("/") ||
          input.endsWith("*")) {
        if ((value == "+" || value == "-" || value == "/" || value == "*")) {
          input = input.substring(0, input.length - 1);
        }
      }
      if (output.isNotEmpty) {
        if (value == "+" || value == "-" || value == "/" || value == "*") {
          input = output;
          output = '';
          hideInput = false;
        } else {
          output = '';
        }
      }
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          //input output area
          Expanded(
              child: Container(
            width: double.infinity,
            color: AppColors.bgLightBlack,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hideInput ? "" : input,
                  style: const TextStyle(
                    fontSize: 48,
                    color: AppColors.buttonTextWhite1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  output,
                  style: TextStyle(
                    fontSize: outputSize,
                    color: AppColors.buttonTextWhite1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
          //Buttons Area
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                button(
                  text: 'AC',
                  textColor: AppColors.buttonTextOrange2,
                  buttonColor: AppColors.bgButtonBlack2,
                ),
                button(
                  text: '<',
                  textColor: AppColors.buttonTextOrange2,
                  buttonColor: AppColors.bgButtonBlack2,
                ),
                // this expanded widget is not related to code, i just added it here for fun
                // Expanded(
                //     child: Container(
                //         margin: const EdgeInsets.all(8),
                //         child: ElevatedButton(
                //           onPressed: () async {
                //             await showDialog(
                //               context: context,
                //               builder: (_) => Dialog(
                //                 child: Container(
                //                   width: 300,
                //                   height: 300,
                //                   decoration: const BoxDecoration(
                //                       image: DecorationImage(
                //                           image: ExactAssetImage(madao),
                //                           fit: BoxFit.cover)),
                //                 ),
                //               ),
                //             );
                //           },
                //           style: ElevatedButton.styleFrom(
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(12)),
                //               padding: const EdgeInsets.all(22),
                //               backgroundColor: Colors.black),
                //           child: const Text(''),
                //         ))),
                // you can comment out the part above, from Expanded, as it is not part of calculator
                // and just add the following code in place of Expanded :
                button(
                  text: '',
                  buttonColor: AppColors.bgBlack,
                ),
                button(
                  text: '/',
                  buttonColor: AppColors.bgButtonBlack2,
                ),
              ],
            ),
          ),
          Row(
            children: [
              button(
                text: '7',
              ),
              button(
                text: '8',
              ),
              button(
                text: '9',
              ),
              button(
                text: '*',
                buttonColor: AppColors.bgButtonBlack2,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: '4',
              ),
              button(
                text: '5',
              ),
              button(
                text: '6',
              ),
              button(
                text: '-',
                buttonColor: AppColors.bgButtonBlack2,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: '1',
              ),
              button(
                text: '2',
              ),
              button(
                text: '3',
              ),
              button(
                text: '+',
                buttonColor: AppColors.bgButtonBlack2,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: '%',
              ),
              button(
                text: '0',
              ),
              button(
                text: '.',
              ),
              button(
                text: '=',
                buttonColor: AppColors.bgButtonOrange2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    text,
    textColor = AppColors.buttonTextWhite1,
    buttonColor = AppColors.bgButtonBlack1,
  }) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () => onButtonClick(text),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(22),
                  backgroundColor: buttonColor),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
  }
}
