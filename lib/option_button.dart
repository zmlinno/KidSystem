import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  //final Function onPressed;
   final VoidCallback onPressed;

  OptionButton(this.title, this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
      child: Column(
        children: <Widget>[

          Icon(icon, size: 50,color:Colors.red),
          Text(title),
        ],
      ),
    );
  }
}

