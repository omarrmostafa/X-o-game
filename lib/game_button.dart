import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  String button;
  Function onbtnclick;
  int index;

  GameButton(this.button,this.index,this.onbtnclick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white60,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50))
        ),
          onPressed: () {
            onbtnclick(index);
          },
          child: Text(
            button,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
