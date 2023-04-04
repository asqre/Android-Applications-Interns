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
      title:
          'Testing..', // this tittle is appeared in recent app page of android phone
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Text Form'),
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
  final contrlr1 = TextEditingController();
  final contrlr2 = TextEditingController();

  // create a global form key
  final _formKey = GlobalKey<FormState>();
  //create a function that have Textformfield
  Widget customTextFormField(
      {required BuildContext context,
      required TextEditingController controlr,
      String? intValue}) {
    //we used named parameter in widget function. so that we can use particular argument
    // at required location.
    // we can take  or not take the string initValue . coz, question mark.
    //string datatype is taken just for understanding purpose.
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            color: Colors.yellow.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Some Text";
                  } else {
                    return null;
                  }
                },
                controller: controlr,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Enter Your Name",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        debugPrint(controlr.text.toUpperCase());
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Data is under process...."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                    prefixIcon: const Icon(
                        IconData(0xf522, fontFamily: 'MaterialIcons'))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          customTextFormField(context: context, controlr: contrlr1),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 0,
              itemBuilder: (BuildContext context, int ind) {
                return customTextFormField(
                  context: context,
                  controlr: contrlr2,
                );
              },
              separatorBuilder: (BuildContext context, int ind) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
