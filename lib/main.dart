import 'dart:convert';

import 'package:coronatest/DatabaseViewer.dart';
import 'package:coronatest/QRcodegenerator.dart';
import 'package:coronatest/QRcodescanner.dart';
import 'package:coronatest/TestUI.dart';
import 'package:coronatest/personInfo.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/qrcodeScanner': (context) => QRScanner(),
      '/qrcodegenerator': (context) => QRGenerator(),
      '/dbViewer': (context) => DatabaseViewer(),
      '/test': (context) => TestUI(),
      '/personInfo': (context) => PersonInfo()
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
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ESK-SIC\nCorona Verwaltung",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w900
                    )
                  ),
                  Image(image: AssetImage("assets/esk.png"), height: 50,)
                ],
              ),
              SizedBox(height: 50),
              
              Center(
                child: Container(
                  height: 150,
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
                      color: Color(0xff618884),
                    ),
                  ),
                )
              ),

              SizedBox(height: 50),

              Center(
                child: Container(
                  height: 150,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/qrcodegenerator");
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
                                "QR-Code erstellen",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      color: Colors.grey[500],
                    ),
                  ),
                )
              ),

              SizedBox(height: 50),


              Center(
                child: Container(
                  height: 150,
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
                      color: Colors.grey[850],
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
