// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:scanner_linkup_app/Models/qr_model.dart';

// class QRGenerator extends StatefulWidget {
//   const QRGenerator({super.key});

//   @override
//   State<QRGenerator> createState() => _QRGeneratorState();
// }

// class _QRGeneratorState extends State<QRGenerator> {
//   CollectionReference ref = FirebaseFirestore.instance.collection('tickets');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: ref.get(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (ctx, index) {
//                     QRModel obj = QRModel.fromDocumentSnapshot(
//                         doc: snapshot.data!.docs[index]);
//                     return Column(
//                       children: [
//                         ListTile(
//                           tileColor: Colors.grey.withOpacity(0.2),
//                           title: Text(
//                             obj.qrcode.toString(),
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                         QrImage(
//                           data: obj.qrcode.toString(),
//                           version: QrVersions.auto,
//                           size: 200.0,
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                       ],
//                     );
//                   });
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator());
//             }
//           }),
//     );
//   }
// }
