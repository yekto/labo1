import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labo1/screens/login.dart';
import 'package:labo1/widgets/changescreen.dart';
import 'package:labo1/widgets/mytextformField.dart';
import 'package:labo1/widgets/passwordtextformfield.dart';
import '../widgets/mybutton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

final _formKey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;
String? emails;
String email = emails ?? 'default';
String? passwords;
String password = passwords ?? 'default';

class _SignUpState extends State<SignUp> {
  void vaildation() async {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user?.uid);
        _scaffoldKey.currentState?.showBottomSheet((context) => Container( color: Colors.green,
            child: Text(
              "Registration SUCCEEDED, go to Login Now!! ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.w700),
            )));
      } catch (e) {
        print(e.toString());
        _scaffoldKey.currentState?.showBottomSheet((context) => Container( color: Colors.red,
                child: Text(
              "Email " + email + " is already to used!!! ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.w700),
            )));
      }
    } else {
      print("no");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 400,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MyTextFormField(
                              name: "Username",
                              validator: (value) {
                                if (value == "") {
                                  return "Please fill this form";
                                } else if (value!.length < 6) {
                                  return "Username is too Short";
                                } else if (value.contains(" ")) {
                                  return "Contains SPACES";
                                }
                                return null;
                              }),
                          MyTextFormField(
                              name: "Email",
                              onChanged: (value) {
                                setState(() {
                                  emails = value;
                                });
                              },
                              validator: (value) {
                                if (value == "") {
                                  return "Please fill this form Dude";
                                } else if (!regExp.hasMatch(value!)) {
                                  return "Invalid email";
                                }
                                return null;
                              }),
                          PasswordTextFormField(
                              name: "Password",
                              obserText: obserText,
                              onChanged: (value) {
                                setState(() {
                                  passwords = value;
                                });
                              },
                              validator: (value) {
                                if (value == "") {
                                  return "Fill the password";
                                } else if (value!.length < 8) {
                                  return "Password min 8 characters";
                                }
                                return null;
                              },
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  obserText = !obserText;
                                });
                              }),
                          MyTextFormField(
                              keyboardType: TextInputType.number,
                              name: "Phone Number",
                              validator: (value) {
                                if (value == "") {
                                  return "Please fill phone number";
                                } else if (value!.length < 11) {
                                  return "Make Sure Your Phone number";
                                } else if (value.contains(" ")) {
                                  return "Contains SPACES";
                                }
                                return null;
                              }),
                          MyButton(
                              name: "SignUp",
                              onPressed: () {
                                vaildation();
                              }),
                          ChangeScreen(
                            name: "Login",
                            whichAccount: "I have already an Account",
                            onTap: (() {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => Login(),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.image),
      ),
    );
  }
}
