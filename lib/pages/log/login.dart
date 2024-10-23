import 'package:chatapp/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

import '../profile.dart/profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext Context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("/////// seccessfluly");
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user no found") {
        print(" ${user},User no found");
      }
    }
    return user;
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController emailContorller = TextEditingController();
  TextEditingController PasswordContorller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login ",
                style: const TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter Your Contact",
                style: TextStyle(
                    //color: Colors.red.shade200,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                key: ValueKey('email'),
                controller: emailContorller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    prefixIcon: Icon(IconlyBold.message, color: Colors.red),
                    hintText: "Emai@gmial.com"),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                key: ValueKey("password"),
                obscureText: true,
                controller: PasswordContorller,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    prefixIcon: Icon(IconlyBold.lock, color: Colors.red),
                    suffixIcon: Icon(Icons.visibility_off, color: Colors.red),
                    hintText: "password"),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                width: double.infinity,
                child: InkWell(
                  onTap: () async {
                    User? user = await loginUsingEmailPassword(
                        email: emailContorller.text,
                        password: PasswordContorller.text,
                        Context: context);
                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => profile()));
                    }
                  },
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              Gap(10),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SingInPage()));
                  },
                  child: Text("Don't have account sin Up?")),
            ],
          ),
        ),
      ),
    );
  }
}
