import 'package:flutter/material.dart';
import 'package:qr_code_pretty/qr_code_pretty.dart';

class QRGenerator extends StatefulWidget {
  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  bool showQRcode = false;
  final myController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: showQRcode ? 
                QrCodePretty(
                  typeNumber: 3,
                  size: 200,
                  data: myController.text,
                )
                :Text("lool"),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: myController,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  hintText: 'Beispieleingabe: 1;Hannes Kucera',
                  hintStyle: TextStyle(
                    fontSize: 22
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: (){
                print(myController.text);
                setState((){
                  
                  showQRcode = true;
                });
              },
              child: Text(
                "Generieren",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            )
          ],
        )
      ),
    );
  }


}