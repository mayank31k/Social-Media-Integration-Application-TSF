import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  RoundButton({@required this.colour, @required this.Press,@required this.Caption});

  final Color colour;
  final String Caption;
  final Function Press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 8.0,
        color:colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: Press,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            Caption,
            style: TextStyle(
                color: Colors.white,
                    fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}