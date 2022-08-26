import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants.dart';
import 'package:flutter_firebase_app/widgets/custom_btn.dart';
import 'package:flutter_firebase_app/widgets/input_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool registerFormLoading = false;

  //will store form inputted values
  String _registerEmail = "";
  String _registerPassword = "";

  //focus node for input fields, when enter change focus from email field to password field
  FocusNode _passwordFieldFocusNode;

  @override
  void initState() {
    _passwordFieldFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Create new Account!",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,
                  ),
                ),
                Column(
                  children: [
                    CustomInputField(
                      txt: "Email",
                      onChanged: (value) {
                        _registerEmail = value.trim();
                      },
                      onSubmited: (value) { //onSubmitted event required for focus change
                        _passwordFieldFocusNode.requestFocus(); //request focus aster email field value submission
                      },
                      textInputAction: TextInputAction.next, //change button value in virtual keyboard
                    ),
                    CustomInputField(
                      txt: "Password",
                      isPasswordField: true,
                      onChanged: (value) {
                        _registerPassword = value.trim();
                      },
                      focusNode: _passwordFieldFocusNode,
                      onSubmited: (value) { //used here to activate field checks
                        _submitForm();
                      },
                    ),
                    CustomBtn(
                        txt: "Create new account",
                        press: () {
                          _submitForm();
                        },
                      isLoading: registerFormLoading,
                    ),
                  ],
                ),
                Padding( //can't assign SizedBox as this will messed up all custom widgets on top (input field and button)
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CustomBtn(
                      txt: "Back to login page",
                      press: () {
                        Navigator.pop(context);
                      },
                      outlineBtn: true),
                ),
              ],
            ),
          ),
        )
    );
  }

  //alert dialog future
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
      barrierDismissible: false, //allow to specify close of the window only by button
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text(
              error,
            ),
          ),
          actions: [
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  //create new user account, return String in our case errors
  Future<String> _createAccount() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail,
          password: _registerPassword,
      );
      //means that user is registered in Firebase
      return null;
    }
     on FirebaseAuthException catch (error){
      //if errors in Firebase
       if (error.code == 'weak-password') {
         return 'The password provided is too weak.';
       } else if (error.code == 'email-already-in-use') {
         return 'The account already exists for that email.';
       }
       else{
         //other errors
         return error.message;
       }
    }
    catch (error) {
      return error.toString();
    }
  }

  //method for form submission, used in two places, thus as separate method
  void _submitForm() async {
    String _createAccountFeedback = await _createAccount();

    setState(() {
      registerFormLoading = true;
    });

    if(_createAccountFeedback != null){//means that there are some errors during user registration process
      _alertDialogBuilder(_createAccountFeedback);

      setState(() {
        registerFormLoading = false;
      });
    }
    else{ //user is registered
      Navigator.pop(context);
    }
  }
}
