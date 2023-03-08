import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner_linkup_app/Screens/drawer_screen.dart';


class AttendeesScreen extends StatefulWidget {
  const AttendeesScreen({super.key});

  @override
  State<AttendeesScreen> createState() => _AttendeesScreenState();
}

class _AttendeesScreenState extends State<AttendeesScreen> {
  late int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 56, 171, 216),
          centerTitle: true,
          title: Text(
            "Attendees",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.search),
            )
          ],
        ),
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            RadioListTile(
              value: 1,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              // subtitle: Text("Radio 1 Subtitle"),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 3,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 4,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 5,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 6,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 7,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 8,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 9,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
            RadioListTile(
              value: 10,
              groupValue: selectedRadioTile,
              title: Row(
                children: [
                  Text(
                    "John Doe",
                  ),
                  Text(
                    "  #12345678",
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                  ),
                ],
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              selected: false,
            ),
          ],
        )),
      ),
    );
  }
}
