import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants.dart';
import 'package:flutter_firebase_app/screens/register_page.dart';
import 'package:flutter_firebase_app/widgets/custom_btn.dart';
import 'package:flutter_firebase_app/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool loginFormLoading = false;

  String _loginEmail = "";
  String _loginPassword = "";

  FocusNode _loginPasswordFieldFocusNode;

  @override
  void initState() {
    _loginPasswordFieldFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _loginPasswordFieldFocusNode.dispose();
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
                  "Welcome user!",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInputField(
                    txt: "Email",
                    onChanged: (value) {
                      _loginEmail = value.trim();
                    },
                    onSubmited: (value){
                      _loginPasswordFieldFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInputField(
                    txt: "Password",
                    isPasswordField: true,
                    onChanged: (value){
                      _loginPassword = value.trim();
                    },
                    focusNode: _loginPasswordFieldFocusNode,
                    onSubmited: (value){
                      _submitForm();
                    },
                  ),
                  CustomBtn(
                    txt: "Login",
                    press: () {
                      _submitForm();
                    },
                    isLoading: loginFormLoading,
                  ),
                ],
              ),
              Padding( //can't assign SizedBox as this will messed up all custom widgets on top (input field and button)
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomBtn(
                    txt: "Create Account",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    outlineBtn: true
                ),
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

  //login user account, return String in our case errors
  Future<String> _loginToAccount() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _loginEmail,
        password: _loginPassword,
      );
      //means that user is existing in Firebase
      return null;
    }
    on FirebaseAuthException catch (error){
      //if errors in Firebase
      if (error.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

        //other errors
        return error.message;
    }
    catch (error) {
      return error.toString();
    }
  }

  //method for form submission, used in two places, thus as separate method
  void _submitForm() async {
    String _loginAccountFeedback = await _loginToAccount();

    setState(() {
      loginFormLoading = true;
    });

    if( _loginAccountFeedback != null){//means that there are some errors during user login process
      _alertDialogBuilder(_loginAccountFeedback);

      setState(() {
        loginFormLoading = false;
      });
    }
  }
}
