import 'dart:convert';

import 'package:coronatest/personInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DatabaseViewer extends StatefulWidget {
  @override
  _DatabaseViewerState createState() => _DatabaseViewerState();
}

class _DatabaseViewerState extends State<DatabaseViewer> {
  List<dynamic> entries;
  List<String> dataStringList = [];
  bool isDataReady = false;

  List<String> displayList;

  @override
  void initState() {
    super.initState();
    // Fetch data first
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Suche',
                      ),
                      onChanged: (text){
                        setState(() {
                          displayList = dataStringList.where((element) => element.toLowerCase().contains(text.toLowerCase())).toList();
                        });
                      },
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
                  itemCount: displayList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: ()=> changeRoute(index),
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(0,5,0,5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            //dataStringList[index],
                            displayList[index],
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

  // Get data from Database
  void fetchAllData()async{
    final response = await http.get(Uri.https("esktcorona.000webhostapp.com", "/getAllData.php"));
    entries = jsonDecode(response.body);
    
    setState(() {
      isDataReady = true;
    });
    //Convert it to List<String>
    convertData(entries);
  }

  void convertData(dynamic listDynamic)async{

    // Add every entry from the og list which is a dynamic List
    // to a new List that is a List of Strings
    for(var i=0; i < listDynamic.length; i++){
      String id = listDynamic[i]["id"];
      String name = listDynamic[i]["vornachname"];
      dataStringList.add("$id | $name");
     
    }
    // Set the data from the new List of Strings to the displayList
    // so that changes in the TextField will result in filtered Results
    displayList = List.from(dataStringList);
  }

  void changeRoute(int index){
    // Seperate String so only name is available
    var data = displayList[index];
    var split = data.split(" | ");
    // Check in the original list for name Similarity
    for(int i=0; i< entries.length; i++){
      if(entries[i].toString().contains(split[1])){
        // If an entry from the og list matches with the name from the TextField
        // the info will get passed to personInfo for Display
        Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => PersonInfo(personData: entries[i],),
            ));
      }
    }   
  } 
}
