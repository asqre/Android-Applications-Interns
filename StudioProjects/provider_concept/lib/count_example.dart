import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_concept/provider/count_provider.dart';
class countExampleState extends StatefulWidget {
  const countExampleState({Key? key}) : super(key: key);

  @override
  State<countExampleState> createState() => _countExampleStateState();
}

class _countExampleStateState extends State<countExampleState> {

  @override
  Widget build(BuildContext context) {
    final countProvider =Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("amit"),
      ),
      body: Center(
        child: Text(countProvider.count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.SetCount();
        },
        child:
        const Icon(Icons.add),
      ),
    );
  }
}

// ignore: camel_case_types
// class _countExampleState extends StatefulWidget {
//   const _countExampleState({Key? key}) : super(key: key);
//
//   @override
//   State<_countExampleState> createState() => _countExampleStateState();
// }
//
// class _countExampleStateState extends State<_countExampleState> {
//   @override
//   Widget build(BuildContext context) {
//     // declare variable take value of count by provider.
//     final countProvider =Provider.of<CountProvider>(context,listen: false);
//     //create a variable that take a value from  provider of class Countprovider
//     // listen: false is necessary to be able to call Provider
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("amit"),
//       ),
//       body: Center(
//         child: Text(countProvider.count.toString()),
//       ),
//         floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           countProvider.SetCount();
//     },
//           child:
//           const Icon(Icons.add),
//     ),
//     );
//   }
// }
