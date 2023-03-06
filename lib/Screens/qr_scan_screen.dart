import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:scanner_linkup_app/Screens/scan_event_detail.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
       
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Group 10 (1).png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    scanQRCode();
                  },
                  child: Image.asset(
                    'assets/images/Group 10 (2).png',
                    height: 400,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromARGB(255, 56, 170, 215),
                //   ),
                //   onPressed: () {
                //     scanQRCode();
                //   },
                //   child: const Text('Scan QR'),
                // ),
                // const SizedBox(
                //   height: 5.0,
                // ),

                 Text(getResult),

                 const SizedBox(
                  height: 5.0,
                ),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 56, 170, 215),
                  ),
                  onPressed: () {
                    print("thids is scan dddddddddddddd${getResult}");
                   Get.to(ScanEventDetail(qr: getResult,));
                  },
                  child: const Text('See Detail'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
