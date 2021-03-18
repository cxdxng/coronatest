import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
  dynamic personData;
  PersonInfo({Key key, this.personData}) : super(key: key);

  var lastTest = "09.09.2003";
  
  @override
  Widget build(BuildContext context) {
    print(personData);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${personData["id"]} | ${personData["vornachname"]}",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black,thickness: 1,),
              SizedBox(height: 40),
              Text(
                "Positiv getestet: ${personData["positive"]}",
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              SizedBox(height:20),
              Text(
                "Negativ getestet: ${personData["negative"]}",
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              SizedBox(height:20),
              Text(
                "Letzter Test: ${personData["lastTest"]}",
                style: TextStyle(
                  fontSize: 30
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}