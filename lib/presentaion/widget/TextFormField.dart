import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class MyTextFormField extends StatelessWidget {
  late bool readOnly = false;
  final TextEditingController control;
  final TextInputType type;
  late dynamic validator;
  Function? onSubmit;
  Function? onChanged;
  Function()? onTap;
 late  bool isPassword = false;
   String? label;
   String? hint;
   Widget? prefix;
  IconData? suffix;
  Function()? suffixClicked;
  TextStyle? hintStyle=const TextStyle(
    color: Colors.grey,fontSize: 12,
  );
  Color borderColor = Colors.limeAccent;
  Color labelColor = Colors.white;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.blueGrey;
  Color ?prefixIconColor = Colors.limeAccent;
  Color ?suffixIconColor = Colors.limeAccent;
  String? textInputFormat;

  MyTextFormField({Key? key,required this.readOnly, required this.control,
    this.hint, required this.type,this.validator,this.onSubmit,this.onChanged,this.onTap
    ,required this.isPassword, this.label,  this.prefix,this.suffix,this.suffixClicked,required this.borderColor,
    required this.labelColor,required this.textColor,required this.backgroundColor,
     this.prefixIconColor,this.textInputFormat,this.suffixIconColor,this.hintStyle
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        // FilteringTextInputFormatter.allow(RegExp('$textInputFormat')),
      ],
      readOnly: readOnly,
      maxLines: 1,
      controller: control,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: () {
        onTap!();
      },
      obscureText: isPassword,
      onChanged: (value) {
        onChanged!(value);
      },
      style: TextStyle(color: textColor, fontSize: 16),
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
        fillColor: backgroundColor.withOpacity(0.5),
        filled: true,
        labelText: label,
        hintText:hint ,
        labelStyle: TextStyle(color: labelColor, fontSize: 14),
        hintStyle: hintStyle,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixClicked!();
                },
                icon: Icon(suffix,color:suffixIconColor ,),
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 3),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Theme.of(context).textTheme.subtitle1!.color!, width: 3),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 4),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 4),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
