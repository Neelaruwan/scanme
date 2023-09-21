import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({super.key});

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  String? _qrInfo = 'Scan QR Code';
  bool cameraState = false;

  qrCallback(String? code){
    setState(() {
      cameraState = false;
      _qrInfo = code;
    });
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      cameraState = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (cameraState == true) {
            setState(() {
              cameraState = false;
            });
          } else {
            setState(() {
              cameraState = true;
            });
          }
        },
        child: Icon(Icons.camera),
      ),
      body: cameraState
      ? Center(
        child: SizedBox(
          height: 1500,
          width: 600,
          child: QRBarScannerCamera(
            onError: (context, error) => Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            qrCodeCallback: (code){
              qrCallback(code);
            }),
        ),
      )
      : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result : "+ _qrInfo!,
              style: TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      )
    );
  }
}