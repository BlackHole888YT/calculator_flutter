import 'package:calculator_flutter/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
  final Color titleColor;
  final LinearGradient buttonColor;
  final Function() onClick;

  const Button({super.key, required this.title, required this.titleColor, required this.buttonColor, required this.onClick});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    double buttonOutWidth = 77;
    double buttonInWidth = 66.13;
    if(widget.title == '0'){
      buttonOutWidth = 164;
      buttonInWidth = 154;
    }
    return InkWell(
      onTap: widget.onClick,
      child: Container( // out
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
            gradient: AppColors.grayButtonOut,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(4, 4),
              )
            ]
          ),
        height: 77,
        width: buttonOutWidth,
        child: Center(
          child: Container(
            height: 66.13,
            width: buttonInWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: widget.buttonColor
            ),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 30, color: widget.titleColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
