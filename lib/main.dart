import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var diceOne = 1;
  var diceTwo = 1;
  var winner;

  bool clicked = false;

  List diceImages = [1, 2, 3, 4, 5, 6];

  String pictures = 'images/dice1.png';

  void changeDiceOne() {
    setState(() {});
    diceImages.shuffle();
    diceOne = diceImages[0];
  }

  void changeDiceTwo() {
    setState(() {});
    diceImages.shuffle();
    diceTwo = diceImages[0];
  }

  whoWin() {
    if (diceOne > diceTwo) {
      return 'Player 1';
    } else if (diceTwo > diceOne) {
      return 'Player 2';
    } else {
      return Null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tap Dice to Roll',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          clicked == true
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: winner != Null
                      ? Text(
                          '$winner win',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : const Text(
                          "It's a draw",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                )
              : Container(),
          // const SizedBox(
          //   height: 100,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Player 1',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      clicked = false;
                      changeDiceOne();
                    },
                    child: Image.asset(
                      'images/dice$diceOne.png',
                      color: Colors.blue,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Player 2',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      clicked = false;
                      changeDiceTwo();
                    },
                    child: Image.asset(
                      'images/dice$diceTwo.png',
                      color: Colors.yellow,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(
          //   height: 50,
          //   width: 50,
          // ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              primary: Colors.white,
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              setState(() {});
              clicked = true;
              winner = whoWin();

              winner != Null
                  ? debugPrint('$winner win')
                  : debugPrint("It's a draw");
            },
            child: const Text(
              'Check the winner',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
