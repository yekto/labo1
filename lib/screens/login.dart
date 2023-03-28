import 'package:flutter/material.dart';
import 'package:labo1/screens/signup.dart';
import 'package:labo1/widgets/changescreen.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextformField.dart';
import '../widgets/passwordtextformfield.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);

void vaildation() {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    print("yes");
  } else {
    print("no");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 330,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      MyTextFormField(
                          name: "Email address",
                          validator: (value) {
                            if (value == "") {
                              return "Please fill email";
                            } else if (!regExp.hasMatch(value!)) {
                              return "Email invalid Dude";
                            }
                            return "";
                          }),
                      PasswordTextFormField(
                          name: "Password",
                          obserText: obserText,
                          validator: (value) {
                            if (value == "") {
                              return "Fill the password";
                            } else if (value!.length < 8) {
                              return "Password min 8 characters";
                            }
                            return "";
                          },
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              obserText = !obserText;
                            });
                          }),
                      MyButton(
                          name: "Login",
                          onPressed: () {
                            vaildation();
                          }),
                      ChangeScreen(
                          whichAccount: "I haven not an Account",
                          onTap: (() {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => SignUp(),
                              ),
                            );
                          }),
                          name: "SignUp")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
