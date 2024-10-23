import 'package:chatapp/auth/singIn.dart';
import 'package:chatapp/pages/log/login.dart';
import 'package:chatapp/pages/profile.dart/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage>
    with SingleTickerProviderStateMixin {
  final _formkey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sing In ",
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
                key: ValueKey("username"),
                validator: (value) {
                  if (value.toString().length < 5) {
                    return "User Name Is to small";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  setState(() {
                    username = newValue!;
                  });
                },
                // obscureText: true,
                //   controller: PasswordContorller,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    prefixIcon: Icon(IconlyBold.profile, color: Colors.red),
                    //    suffixIcon: Icon(Icons.visibility_off, color: Colors.red),
                    hintText: "Enter Usename"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                key: ValueKey("email"),
                validator: (value) {
                  if (!(value.toString().contains('@'))) {
                    return "Email is Invalid";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  setState(() {
                    email = newValue!;
                  });
                },
                // obscureText: true,
                //   controller: PasswordContorller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    prefixIcon: Icon(IconlyBold.message, color: Colors.red),
                    // suffixIcon: Icon(Icons.visibility_off, color: Colors.red),
                    hintText: "Enter email"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                key: ValueKey("password"),
                validator: (value) {
                  if (value.toString().length < 3) {
                    return "password must 6 character";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  setState(() {
                    password = newValue!;
                  });
                },
                obscureText: true,
                //   controller: PasswordContorller,
                keyboardType: TextInputType.visiblePassword,
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
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      singIn(email, password);
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
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Don't have account sin Up?"))
            ],
          ),
        ),
      ),
    );
  }
}
