import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QRModel
{
  late final String available_from;
  late final String available_to;
  late final int created_at;
  late final String early_bird_economy_price;
  late final String early_bird_vip_price;
  late final String event_id;
  late final bool is_free;
  late final String no_of_early_bird_economy;
  late final String no_of_early_bird_vip;
  late final String no_of_tickets_available_economy;
  late final String no_of_tickets_available_vip;
  late final String price_economy;
  late final String price_vip;
  late final String qrcode;
  late final String title;
  late final int updated_at;


  QRModel({
  required this. available_from,
  required this. available_to,
  required this. created_at,
  required this. early_bird_economy_price,
  required this. early_bird_vip_price,
  required this. event_id,
  required this. is_free,
  required this. no_of_early_bird_economy,
  required this. no_of_early_bird_vip,
  required this. no_of_tickets_available_economy,
  required this. no_of_tickets_available_vip,
  required this. price_economy,
  required this. price_vip,
  required this. qrcode,
  required this. title,
  required this. updated_at,
});
  QRModel.fromDocumentSnapshot({required DocumentSnapshot doc})
  {
    Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    //id=doc.id;
    available_from=data["available_from"]??"";
    available_to=data["available_to"]??"";
    created_at=data["created_at"]??"";
    early_bird_economy_price=data["early_bird_economy_price"]??"";
    early_bird_vip_price=data["early_bird_vip_price"]??"";
    event_id=data["event_id"]??"";
    is_free=data["is_free"]??"";
    no_of_early_bird_economy=data["no_of_early_bird_economy"]??"";
    no_of_early_bird_vip=data["no_of_early_bird_vip"]??"";
    no_of_tickets_available_economy=data["no_of_tickets_available_economy"]??"";
    no_of_tickets_available_vip=data["no_of_tickets_available_vip"]??"";
    price_economy=data["price_economy"]??"";
    price_vip=data["price_vip"]??"";
    qrcode = data["qrcode"]??"";
    title=data["title"]??"";
    updated_at=data["updated_at"]??"";
  }
}

