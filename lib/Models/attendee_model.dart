import 'package:cloud_firestore/cloud_firestore.dart';

class AttendeModel
{
  late final String title;
  late final String event_id;
  late final String id;


  AttendeModel({
    required this.title,
    required this. event_id,

  });
  AttendeModel.fromDocumentSnapshot({required DocumentSnapshot doc})
  {
    Map<String,dynamic> data=doc.data() as Map<String,dynamic>;
    id=doc.id;
    title=data["title"]??"";
    event_id=data["event_id"]??"";

  }
}