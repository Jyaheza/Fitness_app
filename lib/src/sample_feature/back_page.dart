import 'package:flutter/material.dart';

class BackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back Workout'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Image.asset('assets/images/back${index + 1}.gif'),
                ),
                Text(
                  '4 x 2 Reps',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
