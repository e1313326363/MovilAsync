import 'package:flutter/material.dart';

import 'services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Asyncrona',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 0, 20, 66),
          secondary: const Color.fromARGB(255, 192, 179, 255),
        ),
      ),
      home: const ButtonsAsincronos(title: 'App Asíncrona'),
    );
  }
}

class ButtonsAsincronos extends StatefulWidget {
  const ButtonsAsincronos({super.key, required this.title});

  final String title;

  @override
  State<ButtonsAsincronos> createState() => _ButtonsAsincronosState();
}

class _ButtonsAsincronosState extends State<ButtonsAsincronos> {
  //DECLARACIONES DE VARIABLES
  int f = 0;
  int f_time = 0;
  double f_bar_with = 0;
  int f_text = 0;

  int l = 0;
  int l_time = 0;
  double l_bar_with = 0;
  int l_text = 0;

  int v = 0;
  int v_time = 0;
  double v_bar_with = 0;
  int v_text = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: Colors.green.shade900,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    f_bar_with = 300;
                    f_time = 1;
                  });
                  f = await MockApi().getFerrariInteger();
                  setState(() {
                    f_text = f;
                    f_time = 0;
                    f_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: f_bar_with,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.green.shade900),
                  duration: Duration(seconds: f_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                f.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.orange.shade700,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.airport_shuttle,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    l_bar_with = 300;
                    l_time = 3;
                  });
                  l = await MockApi().getHyundaiInteger();
                  setState(() {
                    l_text = l;
                    l_time = 0;
                    l_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: l_bar_with,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.orange.shade700),
                  duration: Duration(seconds: l_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                l.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.redAccent.shade700,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.directions_walk,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    v_bar_with = 300;
                    v_time = 10;
                  });
                  v = await MockApi().getFisherPriceInteger();
                  setState(() {
                    v_text = v;
                    v_time = 0;
                    v_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: v_bar_with,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.redAccent.shade700),
                  duration: Duration(seconds: v_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                v.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
