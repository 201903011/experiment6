import 'package:experiment4/pages/foodapp.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;

  moveTohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      final SharedPreferences prefs = await _prefs;
      final bool t1 = true;

      setState(() {
        changebutton = true;
        log_info = prefs.setBool('t1', t1);
        print("set t1 ${t1}");
      });
      await Future.delayed(Duration(seconds: 1));
      try {
        final user = await _auth
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then(
              (user) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FoodApp()),
              ),
            );
      } on Exception catch (e) {
        // TODO
      }

      setState(() {
        changebutton = false;
      });
    }
  }

  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    final SharedPreferences prefs = await _prefs;
    final bool? t1 = prefs.getBool('t1');
    print("set t1 ${t1}");
    if (t1 == true) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => FoodApp()));
    }
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        _email = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      onChanged: (value) {
                        _password = value;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Material(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 8.0),
                      child: InkWell(
                        onTap: () => moveTohome(context),
                        child: AnimatedContainer(
                          width: changebutton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          duration: Duration(seconds: 1),
                          child: changebutton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    // )
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: Text("Not have account Sign in"),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
