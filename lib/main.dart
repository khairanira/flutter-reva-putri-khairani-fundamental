import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  int? result = 0, num1 = 0, num2 = 0;
  add() {
    setState(() {
      num1 = int.parse(_controller1.text);
      num2 = int.parse(_controller2.text);
      result = num1! + num2!;
    });
  }

  sub() {
    setState(() {
      num1 = int.parse(_controller1.text);
      num2 = int.parse(_controller2.text);
      result = num1! - num2!;
    });
  }

  multi() {
    setState(() {
      num1 = int.parse(_controller1.text);
      num2 = int.parse(_controller2.text);
      result = num1! * num2!;
    });
  }

  dev() {
    setState(() {
      num1 = int.parse(_controller1.text);
      num2 = int.parse(_controller2.text);
      result = num1! ~/ num2!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Result : $result",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 234, 235, 232),
                hintText: "Enter First Number",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 234, 235, 232),
                hintText: "Enter Second Number",
              ),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton.icon(
                //   onPressed: () {
                //     add();
                //   },
                //   icon: Icon(
                //     Icons.add,
                //   ),
                //   label: Text('ADD'),
                // ),
                ElevatedButton(
                    onPressed: () {
                      add();
                    },
                    child: Text("ADD")),
                ElevatedButton(
                    onPressed: () {
                      sub();
                    },
                    child: Text("SUBSTRACT")),
                ElevatedButton(
                    onPressed: () {
                      multi();
                    },
                    child: Text("MULTIPLY")),
                ElevatedButton(
                    onPressed: () {
                      dev();
                    },
                    child: Text("DEVIDE")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
