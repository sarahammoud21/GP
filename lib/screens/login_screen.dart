import 'package:flutter/material.dart';
import 'package:smart_app/reusable/reusable_widget.dart';
import 'package:smart_app/screens/signup_screen.dart';
import 'package:smart_app/units/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("A7C7E7"),
          hexStringToColor("0096FF"),
          hexStringToColor("1434A4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 25, 0),
            child: Column(children: <Widget>[
              logoWidget("assets/images/LLO.png"),
              SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Enter Email", Icons.email, false, _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Enter password", Icons.lock, false, _passwordTextController),
              SizedBox(
                height: 30,
              ),
              signinSignupButton(context, true, () {}),
              signUpOption(),
              SizedBox(
                height: 99,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
