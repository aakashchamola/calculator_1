import 'package:calculator_1/constants.dart';
import 'package:flutter/material.dart';
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

  onButtonClick(value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "<") {
      input = input.substring(0, input.length - 1);
    } else if (value == "=") {
      var userInput = input;
      userInput = userInput.replaceAll("X", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    } else {
      input = input + value;
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
                  input,
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
                  style: const TextStyle(
                    fontSize: 28,
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
          Row(
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
                text: 'X',
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
                  fontSize: 22,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
  }
}
