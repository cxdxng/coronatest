import 'package:flutter/material.dart';

class DatabaseViewer extends StatefulWidget {
  @override
  _DatabaseViewerState createState() => _DatabaseViewerState();
}

class _DatabaseViewerState extends State<DatabaseViewer> {
  final List<String> entries = <String>['Kennung 1: Schmitz', 'Kennung 2: Müller', 'Kennung 3: Scheer'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                width: 500,
                child: TextField(   
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Suche',
                    
                  ),
                ),
              ),
              SizedBox(height: 20),


              ListView.builder(
                shrinkWrap: true,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){},
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(0,5,0,5),
                      //color: Colors.lightBlueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
