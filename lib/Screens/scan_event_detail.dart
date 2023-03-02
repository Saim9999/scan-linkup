import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner_linkup_app/Models/qr_model.dart';
import 'package:ticketview/ticketview.dart';

import '../Models/event_model.dart';

class ScanEventDetail extends StatefulWidget {
  String? qr;
  ScanEventDetail({super.key, this.qr});

  @override
  State<ScanEventDetail> createState() => _ScanEventDetailState();
}

class _ScanEventDetailState extends State<ScanEventDetail> {
  CollectionReference ref3 = FirebaseFirestore.instance.collection('tickets');

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
            future: ref3.where('qrcode', isEqualTo: widget.qr).get(),
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
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          children: [
                            TicketView(
                              backgroundPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              backgroundColor:
                                  Color.fromARGB(255, 56, 170, 215),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 0),
                              drawArc: true,
                              triangleAxis: Axis.vertical,
                              borderRadius: 6,
                              drawDivider: true,
                              trianglePos: .6,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Title : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "Available From : ",
                                          style: const TextStyle(
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
                                        Text(
                                          'Available To : ',
                                          style: const TextStyle(
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
                                        Text(
                                          "Early Bird Economy Price : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "No Of Tickets Available Economy : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "No Of Early Bird Economy : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "Price Economy : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "Early Bird Vip Price : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "No Of Tickets Available Vip : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "No Of Early Bird Vip : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "Price Vip : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "Free : ",
                                          style: const TextStyle(
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
                                        Text(
                                          "QR Code : ",
                                          style: const TextStyle(
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
                                    SizedBox(
                                      height: 60,
                                    ),
                                    QrImage(
                                      data: obj.qrcode.toString(),
                                      version: QrVersions.auto,
                                      size: 200.0,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider()
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
