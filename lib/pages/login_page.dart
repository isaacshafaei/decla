import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginpage/widgets/rounded_circular_button.dart';
import 'package:loginpage/widgets/rounded_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  String email="",password=""; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [_header(context), _loginForm(context)],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      color: const Color.fromRGBO(230, 253, 253, 1.0),
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
          Image.asset(
            "assets/images/my-bg.png",
            width: MediaQuery.of(context).size.width * 0.50,
            height: double.infinity,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.70,
      child: Form(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _formFields(context),
            _bottomButtons(context),
          ],
        ),
      )),
    );
  }

  Widget _formFields(BuildContext context) {
    return const SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedTextFormField(
              prefixIcon: Icons.email_outlined, hintText: "Email Address"),
          SizedBox(height: 16), // Adding 16 pixels of vertical space
          RoundedTextFormField(
            prefixIcon: Icons.lock_outline,
            hintText: "Password",
            obsecureText: true,
          ),
          SizedBox(height: 16), // Adding 16 pixels of vertical space
          Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget _bottomButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.07,
          child: const RoundedCircularButton(
            text: "Sign In",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: const Text(
              "I Don't Have an Account",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
