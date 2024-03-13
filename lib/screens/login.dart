import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:today_news/common_widgets.dart';
import 'package:today_news/screens/home.dart';
import 'package:today_news/strings.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = false;
  TextEditingController _conEmail = TextEditingController();
  TextEditingController _conPassword = TextEditingController();

  _login(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
        return null;
      });
    } on FirebaseAuthException catch (e) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(e.code.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,title: Strings.login),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _conEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(Strings.email),
                    hintText: "${Strings.enter} ${Strings.email}"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _conPassword,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                    label: Text(Strings.password),
                    hintText: "${Strings.enter} ${Strings.password}"),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_conEmail.text.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Enter Email"),
                            );
                          });
                      return;
                    }
                    if (_conPassword.text.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Enter Password"),
                            );
                          });
                      return;
                    }
                    if (!RegExp(Strings.pattern).hasMatch(_conEmail.text)) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Enter Valid Email"),
                            );
                          });
                      return;
                    }
                    if (!(!RegExp(Strings.passwordPatten)
                        .hasMatch(_conPassword.text))) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Enter Valid Password"),
                            );
                          });
                      return;
                    }
                    _login(_conEmail.text.toString(),_conPassword.text.toString());
                  },
                  child: Text(Strings.login))
            ],
          ),
        ),
      ),
    );
  }
}
