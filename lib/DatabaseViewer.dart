import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DatabaseViewer extends StatefulWidget {
  @override
  _DatabaseViewerState createState() => _DatabaseViewerState();
}

class _DatabaseViewerState extends State<DatabaseViewer> {
  List<dynamic> entries;
  bool isDataReady = false;

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(   
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Suche',
                        
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      
                      
                    },
                    
                    child: Text("Suchen"),
                  )
                ],
              ),
              SizedBox(height: 20),
              isDataReady?
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){},
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(0,5,0,5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            formatJson(entries[index]),
                            style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    );
                  }
                ),
              ):CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  void fetchAllData()async{
    final response = await http.get(Uri.https("esktcorona.000webhostapp.com", "/index.php"));
    entries = jsonDecode(response.body);
    setState(() {
      isDataReady = true;
    });
    //convertData();
  }

  void convertData()async{
    int length = await entries.length;
    List<Map<String,dynamic>> laal;

    for(int i=0; i < length; i++){
      laal.add(jsonDecode(entries[i]));
    }
    print("Data: $laal");
  }

  String formatJson(dynamic data){
     print(data["id"]);
     String id = data["id"];
     String name = data["vornachname"];

     return "$id | $name";
  }

  
}
