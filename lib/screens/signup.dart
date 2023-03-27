import 'package:flutter/material.dart';
import 'package:labo1/screens/login.dart';
import 'package:labo1/widgets/changescreen.dart';
import 'package:labo1/widgets/mytextformField.dart';
import '../widgets/mybutton.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

final _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void vaildation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("yes");
    } else {
      print("no");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                      height: 50,
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
                          MyTextFormField(name: "Username", validator: (value) {
                            if (value == "") {
                              return "Please fill this form";
                            } else if (value!.length < 6) {
                              return "Username is too Short";
                            }
                            return "";
                          }),
                          MyTextFormField(name: "Email", validator: (value) {
                            if (value == "") {
                              return "Please fill this form Dude";
                            } else if (!regExp.hasMatch(value!)) {
                              return "Email invalid Dude";
                            }
                            return "";
                          }),

                          TextFormField(
                            obscureText: obserText,
                            validator: (value) {
                              if (value == "") {
                                return "Please Fill Password";
                              } else if (value!.length < 8) {
                                return "Min length is 8 character";
                              }
                              return "";
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white.withOpacity(0.8),
                              filled: true,
                              hintText: "Password",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      obserText = !obserText;
                                    },
                                  );
                                  FocusScope.of(context).unfocus();
                                },
                                child: Icon(
                                  obserText == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == "") {
                                return "Please fill phone number";
                              } else if (value!.length < 11) {
                                return "Make Sure Your Phone number";
                              }
                              return "";
                            },
                            decoration: InputDecoration(
                              // icon: Icon(Icons.phone),
                              fillColor: Colors.white.withOpacity(0.8),
                              filled: true,
                              hintText: "Phone Number",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                          ),

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
