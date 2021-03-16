import 'dart:convert';

import 'package:coronatest/DatabaseViewer.dart';
import 'package:coronatest/QRcode.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/qrcodeScanner': (context) => QRScanner(),
      '/dbViewer': (context) => DatabaseViewer(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "ESK-Coronatest Verwaltung",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w900
                      )
                    ),
                  ),
                  Image(image: AssetImage("assets/esk.png"), height: 50,)
                ],
              ),
              SizedBox(height: 30),
              
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/qrcodeScanner");
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.qr_code_scanner_sharp,size: 40,color: Colors.white,),
                              Text(
                                "QR-Code scannen",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      color: Color(0xff00c7c7),
                    ),
                  ),
                )
              ),

              SizedBox(height: 50),


              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: InkWell(
                    onTap: (){
                                
                      Navigator.pushNamed(context, "/dbViewer");
                      
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.format_list_numbered_sharp,size: 40,color: Colors.white,),
                              Text(
                                "Daten anzeigen",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      color: Color(0xff2c393f),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
