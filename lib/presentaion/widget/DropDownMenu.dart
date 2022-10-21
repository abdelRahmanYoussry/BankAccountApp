import 'package:flutter/material.dart';

class MyDropDownMenuButton extends StatelessWidget {
   Text hint;
  var myDropDownItems;
    double height;
    var context;
    late dynamic  validator;
       Function? onChange;
      Color borderColor ;
       Color labelColor ;
       Color textColor ;
   MyDropDownMenuButton({Key? key,
  required this.height,
  required this.hint,
  required this.borderColor,
  required this.validator,
  required this.textColor,
  required this.labelColor,
  required this.onChange,
  required this.myDropDownItems,
  required this.context,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(
        elevation: 6,
        borderRadius:BorderRadius.circular(30) ,
        onTap:(){} ,
        validator:validator,
        hint: hint,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Theme.of(context).textTheme.subtitle1!.color!),
          errorStyle:  const TextStyle(
              fontSize: 12,
              color: Colors.red),
          labelStyle: TextStyle(color: labelColor, fontSize: 12
          ),
          errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 3,color: Colors.red
              )
          ),
          focusedErrorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 3,color: Colors.red
              )
          ) ,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 3,color: Theme.of(context).textTheme.subtitle1!.color!
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 3,color: borderColor
              )
          ),
        ),
        dropdownColor: Theme.of(context).backgroundColor,
        style:  TextStyle(
            color: Theme.of(context).textTheme.subtitle1!.color!, fontSize: 14
        ),
        iconEnabledColor: Colors.grey[400],
        isExpanded: false,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 20,
        menuMaxHeight:MediaQuery.of(context).size.height/5 ,
        focusColor: Colors.limeAccent,
        onChanged: (value) {
          onChange!(value);
        },
        items: myDropDownItems);
  }
}
