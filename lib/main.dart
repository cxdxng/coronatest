import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Loading(),
  ));
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final List<String> entries = <String>['Kennung 1: Schmitz', 'Kennung 2: Müller', 'Kennung 3: Scheer'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21262d),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ESK-Coronatest Verwaltung",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900
                )
              ),
              SizedBox(height: 20),

              Container(
                width: 500,
                child: TextField(   
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Suche',
                    labelStyle: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),


              ListView.builder(
                shrinkWrap: true,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => print("loool"),
                    child: Card(
                      
                      margin: EdgeInsets.fromLTRB(0,5,0,5),
                      color: Colors.lightBlueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entries[index],style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
