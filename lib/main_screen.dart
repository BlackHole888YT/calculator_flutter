import 'package:calculator_flutter/button.dart';
import 'package:calculator_flutter/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String result = '0';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 40, color: Colors.white),
              )
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                spacing: 10,
                children: [
                  Button(title: 'C', titleColor: Colors.white, buttonColor: AppColors.lightGrayButton, onClick: (){
                    result = '0'; setState(() {});
                  }),
                  Button(title: '+/-', titleColor: Colors.white, buttonColor: AppColors.lightGrayButton, onClick: (){}),
                  Button(title: '%', titleColor: Colors.white, buttonColor: AppColors.lightGrayButton, onClick: (){}),
                  Button(title: '/', titleColor: Colors.white, buttonColor: AppColors.orangeButton, onClick: (){}),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                spacing: 10,
                children: [
                  Button(title: '7', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                    result += '7'; setState(() {});
                  }),
                  Button(title: '8', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                    result += '8'; setState(() {});
                  }),
                  Button(title: '9', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                    result += '9'; setState(() {});
                  }),
                  Button(title: 'x', titleColor: Colors.white, buttonColor: AppColors.orangeButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                spacing: 10,
                children: [
                  Button(title: '4', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                  Button(title: '5', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                  Button(title: '6', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                  Button(title: '-', titleColor: Colors.white, buttonColor: AppColors.orangeButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                spacing: 10,
                children: [
                  Button(title: '1', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                  Button(title: '2', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                  Button(title: '3', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){
                    if(result == '0') result = '';
                  }),
                  Button(title: '+', titleColor: Colors.white, buttonColor: AppColors.orangeButton, onClick: (){

                  }),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                spacing: 10,
                children: [
                  Button(title: '0', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){

                  }),
                  Button(title: '.', titleColor: Colors.white, buttonColor: AppColors.grayButton, onClick: (){}),
                  Button(title: '=', titleColor: Colors.white, buttonColor: AppColors.orangeButton, onClick: (){}),
                ],
              ),
            )
        ],),
      ),
      ),
    );
  }
}
