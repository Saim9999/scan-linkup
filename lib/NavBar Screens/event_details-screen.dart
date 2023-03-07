import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pie_chart/pie_chart.dart';

import 'attendee_screen.dart';


class EventDetailScreen extends StatefulWidget {
  String? title;
  String? image;
  String? subtitle;
  String? takeId;
  EventDetailScreen({this.title, this.image, this.subtitle,this.takeId});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final colorList = <Color>[
    const Color.fromARGB(255, 56, 171, 216),
  ];

  CollectionReference ref2 =
  FirebaseFirestore.instance.collection('attendence');

  CollectionReference ref =
  FirebaseFirestore.instance.collection('ticketSales');

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.h,
            backgroundColor: const Color.fromARGB(255, 56, 171, 216),
            elevation: 0.0,
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Event Detail",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body:
          ListView(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.h,
                child: Image.network(
                  widget.image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.title.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Text(
                  widget.subtitle.toString(),textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FutureBuilder(
                      future: ref.where('event_id', isEqualTo: widget.takeId).get(),
                      builder: (context, snapshot) {
                        final count1 = snapshot.data?.size ?? 0;
                        return GestureDetector(
                          // onTap: (){
                          //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                          //     return SaleScreen( takeId: widget.takeId);
                          //   }));
                          // },
                          child: PieChart(
                            centerText: count1.toString(),
                            centerTextStyle: TextStyle(
                              fontSize: 26.sp,
                              color: const Color.fromARGB(255, 56, 171, 216),
                            ),
                            ringStrokeWidth: 15,
                            chartLegendSpacing: 20,
                            dataMap: {
                              'Total Sales':
                              double.parse(count1.toString())
                            },
                            chartType: ChartType.ring,
                            chartRadius: 100,
                            baseChartColor: Colors.grey.withOpacity(0.3),
                            colorList: colorList,
                            chartValuesOptions: const ChartValuesOptions(
                                decimalPlaces: 0,
                                showChartValues: false,
                                showChartValueBackground: false,
                                // chartValueBackgroundColor: Colors.amber,
                                showChartValuesInPercentage: false,
                                chartValueStyle: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                            ),
                            totalValue: 100,
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      'assets/images/Vector (3).png',
                      height: 120.h,
                    ),
                  ),
                  FutureBuilder(
                      future: ref2.where('event_id', isEqualTo: widget.takeId).get(),
                      builder: (context, snapshot) {
                        final count = snapshot.data?.size ?? 0;
                        return GestureDetector(
                          onTap: (){
                            Get.to( AttendeesScreen(takeId: widget.takeId,));
                          },
                          child: PieChart(
                            centerText: count.toString(),
                            centerTextStyle: TextStyle(
                              fontSize: 26.sp,
                              color: const Color.fromARGB(255, 56, 171, 216),
                            ),
                            ringStrokeWidth: 15,
                            chartLegendSpacing: 20,
                            dataMap: {
                              'Attending': double.parse(count.toString())
                            },
                            chartType: ChartType.ring,
                            chartRadius: 100,
                            baseChartColor: Colors.grey.withOpacity(0.3),
                            colorList: colorList,
                            chartValuesOptions: const ChartValuesOptions(
                                decimalPlaces: 0,
                                showChartValueBackground: false,
                                showChartValues: false,
                                showChartValuesInPercentage: false,
                                chartValueStyle: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                            ),
                            totalValue: 100,
                          ),
                        );
                      }),
                ],
              ),
            ],
          )
        // }),
      ),
    );
  }
}