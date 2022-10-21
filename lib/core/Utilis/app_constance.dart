import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, {required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


void navigateAndFinish(context,Widget)=>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=>Widget),
            (route) => false);


void showToast({
  required String text,
  required ToastState state})=>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
Color chooseToastColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.Success:
      color=Colors.green;
      break;
    case ToastState.Error:
      color=Colors.red;
      break;
    case ToastState.Warning:
      color=Colors.amber;
      break;
  }
  return color;
}

enum ToastState{Success,Error,Warning}