import 'package:cloud_firestore/cloud_firestore.dart';

class SelectedAttendeeModel
{
  late final String event_id;
  late final String uid;


  SelectedAttendeeModel({
  required this. event_id,
  required this. uid,
});
  SelectedAttendeeModel.fromDocumentSnapshot({required DocumentSnapshot doc})
  {
    Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    //id=doc.id;
    event_id=data["event_id"]??"";
    uid=data["uid"]??"";
  }
}
