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
      title: 'BMI Calculator',
      
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 8, 176, 25)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {

  //     _counter++;
  //   });
  // }
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(
            child: Text(
              'Your BMI',
              style: TextStyle(fontSize: 34),
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  // controller: wtController,
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your weight'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your height in ft'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text('Enter your height in inches'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () {
                      var ft = ftController.text.toString();
                      var wt = wtController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //cal
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iinch = int.parse(inch);

                        var tInch = (ift * 12) + iinch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iwt / (tM * tM);

                        var msg = "";
                        if (bmi > 25) {
                          msg = "GOSH! You are overweight!!";
                        } else if (bmi < 18) {
                          msg = "You are underweight";
                        } else {
                          msg = "You are good to go";
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the options";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                const SizedBox(
                  height: 19,
                ),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
