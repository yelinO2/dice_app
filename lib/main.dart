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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    changeDiceOne();
                  },
                  child: Image.asset(
                    'images/dice$diceOne.png',
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                  ),
                ),
                const Text(
                  'Player 1',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    changeDiceTwo();
                  },
                  child: Image.asset(
                    'images/dice$diceTwo.png',
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                ),
                const Text(
                  'Player 2',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
