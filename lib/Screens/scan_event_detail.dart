import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scanner_linkup_app/Models/qr_model.dart';
import 'package:ticket_widget/ticket_widget.dart';

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
  ) async {
    Map<String, dynamic> atten = {
      'title': title,
      'event_id': event_id,
    };
    ref.add(atten);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
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
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Group 10 (1).png'),
                  fit: BoxFit.fill)),
          child: FutureBuilder(
              future: ref3.where('qrcode', isEqualTo: widget.qr).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                } else {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        'Scan valid ticket.',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    print("this is detail qr ${widget.qr}");
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (ctx, index) {
                          QRModel obj = QRModel.fromDocumentSnapshot(
                              doc: snapshot.data!.docs[index]);
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                TicketWidget(
                                  width: 350,
                                  height: 520,
                                  isCornerRounded: true,
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ticketDetailsWidget(
                                              'Title', obj.title, '', ''),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          ticketDetailsWidget(
                                              'Qr Code', obj.qrcode, '', ''),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 52.0),
                                        child: ticketDetailsWidget(
                                            'Available From',
                                            obj.available_from,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'Available To',
                                            obj.available_to,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'Early Bird Economy Price',
                                            obj.early_bird_economy_price,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'No of Early Bird Economy',
                                            obj.no_of_early_bird_economy,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'Price Economy',
                                            "\$${obj.price_economy}",
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'No of Tickets Available Economy',
                                            obj.no_of_tickets_available_economy,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'Early Bird Vip Price',
                                            obj.early_bird_vip_price,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'No of Early Bird Vip',
                                            obj.no_of_early_bird_vip,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget(
                                            'No of Tickets Available Vip',
                                            obj.no_of_tickets_available_vip,
                                            '',
                                            ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget('Price Vip',
                                            "\$${obj.price_vip}", '', ''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, right: 53.0),
                                        child: ticketDetailsWidget('Free',
                                            obj.is_free.toString(), '', ''),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 56, 171, 216)),
                                    onPressed: () async {
                                      await sendDataToAttendee(
                                          obj.title, obj.event_id);
                                      Fluttertoast.showToast(
                                          msg: "You are Entered in event!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Attend Event")),
                              ],
                            ),
                          );
                        });
                  }
                }
              }),
        ),
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
