import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                        onPressed: (){},
                        child: Text("Bestätigen"),
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
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      sendData(result.code);
    });
  }
  void sendData(String qrdata){
    // Send the data to server here

    var time = DateTime.now();
    var formatter = DateFormat('dd.MM.yy, hh:mm');
    print(formatter.format(time));

    var split = qrdata.split(";");
    Map data = {
      "id": split[0],
      "vornachName": split[1]
    };
  }
}