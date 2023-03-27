import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function onPressed;
  final String name;
  const MyButton ({Key? key, required this.name, required this.onPressed}) : super(key: key);
  // MyButton({required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context){
    return Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white),
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}