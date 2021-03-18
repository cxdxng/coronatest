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
                        print(displayList);
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

  void fetchAllData()async{
    final response = await http.get(Uri.https("esktcorona.000webhostapp.com", "/getAllData.php"));
    entries = jsonDecode(response.body);
    
    setState(() {
      isDataReady = true;
    });
    
    convertData(entries);
  }

  void convertData(dynamic lul)async{
    for(var i=0; i < lul.length; i++){
      String id = lul[i]["id"];
      String name = lul[i]["vornachname"];
      dataStringList.add("$id | $name");
     
    }   
    displayList = List.from(dataStringList);
  }

  void filterSearchResults(String query) {
       
    
  }

  void changeRoute(int index){
    var data = entries[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonInfo(personData: data,),
    ));
  } 
}
