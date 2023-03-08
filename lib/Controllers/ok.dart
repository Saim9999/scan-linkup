// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class okScreen extends StatelessWidget {
//
//
//    okScreen({Key? key}) : super(key: key);
//
// // First, let's define our two collections
//   CollectionReference<Map<String, dynamic>> collection1 =
//   FirebaseFirestore.instance.collection('events');
//   CollectionReference<Map<String, dynamic>> collection2 =
//   FirebaseFirestore.instance.collection('attendence');
//
// // Now, let's query both collections and compare them by their event ID fields
//   Future<void> compareCollections() async {
//     QuerySnapshot<Map<String, dynamic>> collection1Snapshot =
//     await collection1.get();
//     print(collection1.id);
//     QuerySnapshot<Map<String, dynamic>> collection2Snapshot =
//     await collection2.get();
// print(collection2.id);
//     // Convert QuerySnapshots to List of documents
//     List<DocumentSnapshot<Map<String, dynamic>>> collection1Docs =
//         collection1Snapshot.docs;
//     List<DocumentSnapshot<Map<String, dynamic>>> collection2Docs =
//         collection2Snapshot.docs;
//
//     // Loop through both collections and compare their event ID fields
//     for (int i = 0; i < collection1Docs.length && i < collection2Docs.length; i++) {
//       DocumentSnapshot<Map<String, dynamic>> collection1Doc = collection1Docs[i];
//       DocumentSnapshot<Map<String, dynamic>> collection2Doc = collection2Docs[i];
//
//       if (collection1Doc.exists && collection2Doc.exists) {
//         String? collection1EventId = collection1Doc.data()?['event_id'];
//         String? collection2EventId = collection2Doc.data()?['event_id'];
//
//         if (collection1EventId != null && collection2EventId != null && collection1EventId == collection2EventId) {
//           // The event IDs match
//           print('Event ID $collection1EventId exists in both collections');
//         } else {
//           // The event IDs do not match
//           print('Event ID $collection1EventId exists in 1 collections');
//           print('Event ID $collection2EventId exists in 2 collections');
//           print('Event ID $collection1EventId does not exist in collection2');
//         }
//       }
//     }
//
//     // for (int i = 0; i < collection1Docs.length && i < collection2Docs.length; i++) {
//     //   Map<String, dynamic>? collection1Data = collection1Docs[i].data();
//     //
//     //   String? collection1EventId = collection1Docs[i].data()?['event_id'];
//     //   print(collection1Data?.length);
//     //   String? collection2EventId = collection2Docs[i].data()?['event_id'];
//     //   print(collection2Docs.length);
//     //
//     //   if (collection1EventId != null && collection2EventId != null && collection1EventId == collection2EventId) {
//     //     // The event IDs match
//     //     print('Event ID $collection1EventId exists in both collections');
//     //   } else {
//     //     print('Event ID $collection1EventId exists in 1 collections');
//     //     print('Event ID $collection2EventId exists in 2 collections');
//     //     // The event IDs do not match
//     //     print('Event ID $collection1EventId does not exist in collection2');
//     //   }
//     // }
//
//   }
//
// // Call the function to compare the collections
//   void main() {
//     compareCollections();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: TextButton(onPressed: (){
//           compareCollections();
//         }, child: Text("data")),
//
//       ),
//     );
//   }
// }
