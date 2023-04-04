// import 'package:chat_gpt/card_widget.dart';
// import 'package:chat_gpt/text_Widget.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'chatGPT',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const MyHomePage(title: 'New Chat'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.menu),
//         ),
//         title: Text(
//           widget.title,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//             tooltip: 'open new chat',
//           )
//         ],
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               const SizedBox(
//                 child: Text(
//                   'ChatGPT',
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 40,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               SizedBox(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(
//                       Icons.sunny,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       'Examples',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const FilledCard(
//                 userInput: '"Explain quantum computing in simple term"',
//                 trailing: Icon(Icons.arrow_right_alt),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const FilledCard(
//                 userInput:
//                     '"Got any creative ideas for a 10 years olds birthday?"',
//                 trailing: Icon(Icons.arrow_right_alt),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const FilledCard(
//                 userInput: '"How do i make an HTTP request in Javascript?"',
//                 trailing: Icon(Icons.arrow_right_alt),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(
//                       Icons.thunderstorm_outlined,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       'Capabilities',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const FilledCard(
//                   userInput:
//                       'Remember what user said earlier in the conversation'),
//               const SizedBox(
//                 height: 10,
//               ),
//               const FilledCard(
//                   userInput: 'Allow user to provide follow-up corrections'),
//               const SizedBox(
//                 height: 10,
//               ),
//               const FilledCard(
//                   userInput: 'Trained to decline inappropriate requests'),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(
//                       Icons.warning_amber_rounded,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       'Limitations',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const FilledCard(
//                   userInput:
//                       'May occasionally generate incorrect information'),
//               const SizedBox(
//                 height: 10,
//               ),
//               const FilledCard(
//                   userInput:
//                       'May occasionally produce harmful instruction or biased content'),
//               const SizedBox(
//                 height: 10,
//               ),
//               const FilledCard(
//                   userInput:
//                       'Limited knowledge of world and events after 2021'),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:chat_gpt/card_widget.dart';
import 'package:chat_gpt/text_Widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chatGPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'New Chat'),
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            tooltip: 'open new chat',
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              // height: 600,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        child: Text(
                          'ChatGPT',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.sunny,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Examples',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const FilledCard(
                        userInput: '"Explain quantum computing in simple term"',
                        trailing: Icon(Icons.arrow_right_alt),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const FilledCard(
                        userInput:
                        '"Got any creative ideas for a 10 years olds birthday?"',
                        trailing: Icon(Icons.arrow_right_alt),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const FilledCard(
                        userInput: '"How do i make an HTTP request in Javascript?"',
                        trailing: Icon(Icons.arrow_right_alt),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.thunderstorm_outlined,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Capabilities',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const FilledCard(
                          userInput:
                          'Remember what user said earlier in the conversation'),
                      const SizedBox(
                        height: 10,
                      ),
                      const FilledCard(
                          userInput: 'Allow user to provide follow-up corrections'),
                      const SizedBox(
                        height: 10,
                      ),
                      const FilledCard(
                          userInput: 'Trained to decline inappropriate requests'),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.warning_amber_rounded,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Limitations',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const FilledCard(
                          userInput:
                          'May occasionally generate incorrect information'),
                      const SizedBox(
                        height: 10,
                      ),
                      const FilledCard(
                          userInput:
                          'May occasionally produce harmful instruction or biased content'),
                      const SizedBox(
                        height: 10,
                      ),
                      const FilledCard(
                          userInput:
                          'Limited knowledge of world and events after 2021'),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ),
          SizedBox(height: 20,),

          CustomTextField(onSaved: (command){
            debugPrint(command);
          })

          // Container(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //       height: 50,
          //       // color: Colors.blue,
          //       child: SizedBox(
          //         width: 340,
          //         child: CustomTextField(onSaved: (command){
          //           debugPrint(command);
          //         }),
          //       ),
          //
          //     ),
          //   ),),

        ],
      ),
    );
  }
}
