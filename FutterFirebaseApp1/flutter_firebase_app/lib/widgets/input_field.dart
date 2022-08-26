import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants.dart';

class CustomInputField extends StatelessWidget {

  final String txt;

  final Function(String) onChanged; //will be activated on input field value change in brackets, type which will be received
  final Function(String) onSubmited; //will be activated on form submission, required for focus change from one field to other

  final FocusNode focusNode; //required for focus gathering and further request

  final TextInputAction textInputAction; //required to change "Done" button value to "Next" on virtual keyboard

  final bool isPasswordField; //set if input is password field


  const CustomInputField({Key key, this.txt, this.onChanged, this.onSubmited, this.focusNode, this.textInputAction, this.isPasswordField = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        obscureText: isPasswordField, //hide symbol visibility, e.g. password field
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmited,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: txt ?? "Hint text here", //if value is null
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
