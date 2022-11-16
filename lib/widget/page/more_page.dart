import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What is Campus Beautiful Royale?',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            child: Text(
              'Campus beautiful royale is an application that allows the users, usually students of EKU, to vote on what campus location they think is the best one. Votes will be tallied and ran through the same ranking system that the creator of facebook, Mark Zuccy, used in his app called Fash Mash. The reason I am using this algorithm is because this app is inspired by Face Mash the app displayed in the 2010 movie "The Social Network."',
              style: TextStyle(fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
