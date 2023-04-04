import 'package:flutter/material.dart';
import 'package:google_form/function_validator_page.dart';
import 'package:google_form/updating20.dart';
import 'package:google_form/widget_validator_page.dart';
import 'normal_validator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextFormField Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoMono',
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage1(title: 'Different ways of Using validator'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage2(title: 'Normal validator'),
                    ),
                  );
                },
                child: const Text('Normal Validator'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage3(title: 'function validator'),
                    ),
                  );
                },
                child: const Text('Function Validator'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const MyHomePage6(title: 'Updating validator'),
                    ),
                  );
                },
                child: const Text('updated Validator'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage4()));
                  },
                  child: const Text("Widget Validator"))
            ],
          ),
        ),
      ),
    );
  }
}
