import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;


class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;


  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Erkannt: ${result.code}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              color: Colors.red,
                              onPressed: ()=>sendData(result.code, 1),
                              child: Text(
                                "Positiv",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            RaisedButton(
                              color: Colors.green,
                              onPressed: ()=>sendData(result.code, 0),
                              child: Text(
                                "Negativ",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                    )
                    : Text(
                      'Scannen Sie einen Code',
                      style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      
    });
  }
  void sendData(String qrdata, int posOrNeg)async{
    // Send the data to server here

    DateTime time = DateTime.now();
    DateFormat formatter = DateFormat('dd.MM.yy, HH:mm');
    String formattedTime = formatter.format(time);

    var split = qrdata.split(";");
    Map data = {
      "id": split[0],
      "time": formattedTime
    };
    print(data);
    switch (posOrNeg){
      case 0:{
        Response response = await http.post(Uri.https("esktcorona.000webhostapp.com", "/addNegative.php"), body: data);
        print(response.body);
      }
      break;
      case 1:{
        Response response = await http.post(Uri.https("esktcorona.000webhostapp.com", "/addPositive.php"), body: data);
        print(response.body);
      }
      break;
    }

    setState(() {
      result = null;
    });
    
  }
}