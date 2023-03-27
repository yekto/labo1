import 'package:flutter/material.dart';


class ChangeScreen extends StatelessWidget {
  final String name;
  final Function onTap;
  final String whichAccount;

  const ChangeScreen(
      {Key? key,
      required this.whichAccount,
      required this.onTap,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          whichAccount,
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            name,
            style: TextStyle(
                color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
