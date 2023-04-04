import 'package:chatgpt/right_sidebar/card.dart';
import 'package:chatgpt/right_sidebar/card_button.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      // primary: false,
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3.5,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children:  [
        SizedBox(
          height: 70,
          width: 250,
          child: Center(
            child: Column(
              children: const [
                Icon(
                  Icons.sunny,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Examples',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),),
        SizedBox(
          height: 70,
          width: 250,
          child: Center(
            child: Column(
              children: const [
                Icon(
                  Icons.warning_amber_rounded,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Limitations',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),),
        SizedBox(
          height: 70,
          width: 250,
          child: Center(
            child: Column(
              children: const [
                Icon(
                  Icons.thunderstorm_outlined,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Capabilities',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),),
        const CardButton(givenText: '"Explain quantum computing in simple term"',trailing: Icon(Icons.arrow_right_alt),),
        const FilledCard(givenText: 'Remember what user said earlier in the conversation'),
        const FilledCard(givenText: '"How do i make an HTTP request in Javascript?"'),
        const CardButton(givenText: '"Got any creative ideas for a 10 years olds birthday?"',trailing: Icon(Icons.arrow_right_alt)),
        const FilledCard(givenText: 'Allow user to provide follow-up corrections'),
        const FilledCard(givenText: 'Trained to decline inappropriate requests'),
        const CardButton(givenText: '"How do i make an HTTP request in Javascript?"',trailing: Icon(Icons.arrow_right_alt),),
        const FilledCard(givenText: 'Trained to decline inappropriate requests'),
        const FilledCard(givenText: 'Limited knowledge of world and events after 2021'),
      ],
    );
  }
}
