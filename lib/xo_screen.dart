import 'package:flutter/material.dart';
import 'package:xo_gamee/players_model.dart';

import 'game_button.dart';

class XoGame extends StatefulWidget {
  static const String routeNeme="game";
  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  int score1 = 0;

  int score2 = 0;

  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    PlayersModel args=ModalRoute.of(context)!.settings.arguments as PlayersModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("XO Game",),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          args.name1,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold,color:Colors.black),
                        ),
                        Text(
                          "$score1",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold,color: Colors.green),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          args.name2,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold,color:Colors.black),
                        ),
                        Text(
                          "$score2",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold,color: Colors.green),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            child: Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GameButton(board[0], 0, onButtonclick),
                    SizedBox(width: 10),
                    GameButton(board[1], 1, onButtonclick),
                    SizedBox(width: 10),
                    GameButton(board[2], 2, onButtonclick),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GameButton(board[3], 3, onButtonclick),
                    SizedBox(width: 10),
                    GameButton(board[4], 4, onButtonclick),
                    SizedBox(width: 10),
                    GameButton(board[5], 5, onButtonclick),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom:15 ,left: 10,right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GameButton(board[6], 6, onButtonclick),
                    SizedBox(width: 10),
                    GameButton(board[7], 7, onButtonclick),
                    SizedBox(width: 10),
                    GameButton(board[8], 8, onButtonclick),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int counter = 1;
  onButtonclick(index) {
    if (board[index].isNotEmpty) {
      return;
    }
    if (counter.isOdd) {
      board[index] = "X";
      bool win = checkWinner("X");
      if (win) {
        score1 += 10;
        resetboard();
      }
    }
    else {
      board[index] = "O";
      bool win = checkWinner("O");
      if (win) {
        score2 += 10;
        resetboard();
      }
    }
    if(counter==9){
      resetboard();
    }
    counter++;
    setState(() {});
  }
  resetboard(){
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];

    counter=0;
  }
  checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == symbol && board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol && board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }
}


