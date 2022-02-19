import 'package:experiment4/foodapp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  moveTohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      try {
        final newuser = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (newuser != null) {
          await Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FoodApp()),
          );
        }
      } catch (e) {
        print(e);
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
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/signin.png",
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
                      onChanged: (value) {
                        _password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
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
                                  "Signin",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: Text("Already have account Login"),
                      onTap: () async {
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
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
