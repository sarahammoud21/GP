import 'package:flutter/material.dart';
import 'package:smart_app/reusable/reusable_widget.dart';
import 'package:smart_app/screens/home_screen.dart';
import 'package:smart_app/screens/login_screen.dart';
import 'package:smart_app/units/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign up",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
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
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            reusableTextField("Enter UserName", Icons.person_2_outlined, false,
                _usernameTextController),
            const SizedBox(
              height: 40,
            ),
            reusableTextField(
                "Enter Email", Icons.email, false, _emailTextController),
            const SizedBox(
              height: 40,
            ),
            reusableTextField(
                "Enter Password", Icons.lock, true, _passwordTextController),
            const SizedBox(
              height: 90,
            ),
            signinSignupButton(context, false, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
            LogInOption(),
            const SizedBox(
              height: 260,
            ),
          ]),
        )),
      ),
    );
  }

  Row LogInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Text(
            " Log in",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
