import 'package:flutter/material.dart';

class XOGame extends StatefulWidget {
  @override
  _XOGameState createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  List<String> board = List.filled(9, ' ');
  String currentPlayer = 'X';
  String winner = '';

  bool checkWin(String player) {

    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == player && board[i * 3 + 1] == player && board[i * 3 + 2] == player) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
        return true;
      }
    }

    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }

    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }
    return false;
  }

  void onTap(int index) {
    if (board[index] == ' ' && winner == '') {
      setState(() {
        board[index] = currentPlayer;
        if (checkWin(currentPlayer)) {
          winner = currentPlayer;
        } else {
          currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        }
      });
    }
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, ' ');
      currentPlayer = 'X';
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text('XO Game')
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.3,
              ),
              itemCount: 9,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.blue[50],
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
            if (winner != '')
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '$winner is Winner!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: resetGame,
              child: Text('Reset Game'),
            ),
          ],
        ),
    );
  }
}
