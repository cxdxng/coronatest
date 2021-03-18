import 'package:flutter/material.dart';

class TestUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Row(
                        children: [
                          RaisedButton(
                            onPressed: (){},
                            child: Text("Positiv"),
                          ),
                          SizedBox(width: 20),
                          RaisedButton(
                            onPressed: (){},
                            child: Text("Negativ"),
                          ),
                        ],
                      )
        ],
      ),
    );
  }
}