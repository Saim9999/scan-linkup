import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scanner_linkup_app/Models/qr_model.dart';

class ScanEventDetail extends StatefulWidget {
  String? qr;
  ScanEventDetail({super.key, this.qr});

  @override
  State<ScanEventDetail> createState() => _ScanEventDetailState();
}

class _ScanEventDetailState extends State<ScanEventDetail> {
  CollectionReference ref3 = FirebaseFirestore.instance.collection('tickets');
  CollectionReference ref = FirebaseFirestore.instance.collection('attendence');

  QRModel? obj;
  Future sendDataToAttendee(
      String title,
      String event_id,

      ) async
  {
    Map <String,dynamic> atten = {
      'title': title,
      'event_id': event_id,
    };
    ref.add(atten);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: const Color.fromARGB(255, 56, 171, 216),
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Tickets details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      body: SafeArea(
        child: FutureBuilder(
            future: ref3.where('qrcode' , isEqualTo: widget.qr).get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("this is detail qr ${widget.qr}");
                return ListView.builder(
                    // shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) {
                      QRModel obj = QRModel.fromDocumentSnapshot(
                          doc: snapshot.data!.docs[index]);
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                             Column(
                               children: [
                                 const SizedBox(
                                   height: 20,
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "Title : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.title.toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "Available From : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(obj.available_from.toString(),
                                         style: const TextStyle(
                                           color: Colors.black45,
                                           fontSize: 14,
                                         )),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       'Available To : ',
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.available_to.toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "Early Bird Economy Price : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.early_bird_economy_price
                                           .toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "No Of Tickets Available Economy : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.no_of_tickets_available_economy
                                           .toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "No Of Early Bird Economy : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.no_of_early_bird_economy
                                           .toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "Price Economy : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       "\$${obj.price_economy.toString()}",
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "Early Bird Vip Price : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.early_bird_vip_price.toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "No Of Tickets Available Vip : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.no_of_tickets_available_vip
                                           .toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "No Of Early Bird Vip : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.no_of_early_bird_vip.toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "Price Vip : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       "\$${obj.price_vip.toString()}",
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "Free : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.is_free.toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Text(
                                       "QR Code : ",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 16,
                                       ),
                                     ),
                                     Text(
                                       obj.qrcode.toString(),
                                       style: const TextStyle(
                                         color: Colors.black45,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 60,
                                 ),
                                 const SizedBox(
                                   height: 10,
                                 ),
                               ],
                             ),
                            const Divider(),
                            ElevatedButton(onPressed: ()async{
                              await sendDataToAttendee(obj.title,obj.event_id);
                              Fluttertoast.showToast(
                                  msg: "You are Entered in event!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.of(context).pop();
                            }, child: const Text("Attend Event"))
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
