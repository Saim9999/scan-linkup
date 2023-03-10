import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel
{
  late final String address;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String radio;
  late final String role;
  late final String telephone;


  ProfileModel({
    required this. address,
    required this. email,
    required this. firstName,
    required this. lastName,
    required this. radio,
    required this. role,
    required this. telephone,
  });
  ProfileModel.fromDocumentSnapshot({required DocumentSnapshot doc})
  {
    Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    //id=doc.id;
    address=data["address"]??"";
    email=data["email"]??"";
    firstName=data["firstName"]??"";
    lastName=data["lastName"]??"";
    radio=data["radio"]??"";
    role=data["role"]??"";
    telephone=data["telephone"]??"";
  }
}