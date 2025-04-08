import 'package:calculator_flutter/button.dart';
import 'package:calculator_flutter/colors.dart';
import 'package:calculator_flutter/calculator_engine.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String result = '0';
  String expression = '';
  bool isNewExpression = true;

  void _handleButtonPress(String buttonText) {
    setState(() {
      if (isNewExpression) {
        expression = '';
        result = '0';
        isNewExpression = false;
      }

      switch (buttonText) {
        case 'C':
          expression = '';
          result = '0';
          isNewExpression = true;
          break;
        case '=':
          result = CalculatorEngine.calculate(expression);
          isNewExpression = true;
          break;
        case '+/-':
          if (expression.isNotEmpty) {
            if (expression.startsWith('-')) {
              expression = expression.substring(1);
            } else {
              expression = '-$expression';
            }
          }
          break;
        case '%':
          if (expression.isNotEmpty) {
            expression += '%';
          }
          break;
        default:
          expression += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Результат
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  isNewExpression ? result : expression,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              // Кнопки
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          title: 'C',
                          titleColor: Colors.white,
                          buttonColor: AppColors.lightGrayButton,
                          onClick: () => _handleButtonPress('C'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '+/-',
                          titleColor: Colors.white,
                          buttonColor: AppColors.lightGrayButton,
                          onClick: () => _handleButtonPress('+/-'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '%',
                          titleColor: Colors.white,
                          buttonColor: AppColors.lightGrayButton,
                          onClick: () => _handleButtonPress('%'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '/',
                          titleColor: Colors.white,
                          buttonColor: AppColors.orangeButton,
                          onClick: () => _handleButtonPress('/'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          title: '7',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('7'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '8',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('8'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '9',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('9'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: 'x',
                          titleColor: Colors.white,
                          buttonColor: AppColors.orangeButton,
                          onClick: () => _handleButtonPress('x'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          title: '4',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('4'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '5',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('5'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '6',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('6'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '-',
                          titleColor: Colors.white,
                          buttonColor: AppColors.orangeButton,
                          onClick: () => _handleButtonPress('-'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          title: '1',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('1'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '2',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('2'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '3',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('3'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '+',
                          titleColor: Colors.white,
                          buttonColor: AppColors.orangeButton,
                          onClick: () => _handleButtonPress('+'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          title: '0',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('0'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '.',
                          titleColor: Colors.white,
                          buttonColor: AppColors.grayButton,
                          onClick: () => _handleButtonPress('.'),
                        ),
                        const SizedBox(width: 10),
                        Button(
                          title: '=',
                          titleColor: Colors.white,
                          buttonColor: AppColors.orangeButton,
                          onClick: () => _handleButtonPress('='),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
