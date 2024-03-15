import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_gamee/players_model.dart';
import 'package:xo_gamee/xo_screen.dart';

class Login extends StatelessWidget {
  static const String routeNeme = "login";
  String playerOne = "";
  String playerTow = "";
  TextEditingController playerOneController = TextEditingController();
  TextEditingController playerTwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: playerOneController,
              decoration: InputDecoration(
                  hintText: "Player One",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: playerTwoController,
              decoration: InputDecoration(
                  hintText: "Player Two",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, XoGame.routeNeme,
                      arguments: PlayersModel(
                          playerOneController.text, playerTwoController.text));
                },
                style: ElevatedButton.styleFrom(
                    side: BorderSide(style: BorderStyle.solid)),
                child: Text("Go"))
          ],
        ),
      ),
    );
  }
}
