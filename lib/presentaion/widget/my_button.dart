import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double height;
  final double width;
  final double fontSize;
  Color? backGroundColor;
  final double borderRadius;
  final VoidCallback onPress;

  MyButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.height = 54.0,
    this.fontSize=18,
    required this.width ,
    this.backGroundColor,
    this.borderRadius = 8.0,
    required this.onPress,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.teal),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),

        onPressed: (){
          onPress();
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),),
    );
  }
}
