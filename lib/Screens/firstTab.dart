import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({super.key});

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
               Padding(padding: EdgeInsets.all(35),
              child: Container( 
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("lib/Assets/Images/background.jpg"),
                  fit: BoxFit.contain)
                )
              ),),
              Padding(padding: EdgeInsets.only(right: 35,left: 35,bottom: 35),
              child: Container(
                
                child: TextFormField(
                  controller: title,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black)),
                    hintText: "Type here"
                  ),
                ),
              ),),
              MaterialButton(
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    code = title.text;
                  });
                },
                child: Text(
                  "Generate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),),
                code == ''
                ? Text('')
                : Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: BarcodeWidget(
                    data: '$code',
                    width: 200,
                    height: 200, 
                    barcode: Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                    )),
                )
            ],
          ),
        ),
      ),
    );
  }
}