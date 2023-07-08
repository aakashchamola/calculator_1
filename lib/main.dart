import 'package:calculator_1/constants.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlack,
      body: Column(
        children: [
          //Responsive Result area
          Expanded(
              child: Container(
            color: Colors.red,
          )),
          //Buttons Area
          Row(
            children: [
              button(text: "we'll make add all the buttons in the next commit"),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(22),
                  backgroundColor: buttonColor),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
  }
}
