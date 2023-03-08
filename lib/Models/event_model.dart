import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel
{
  late final String title;
  late final String description;
  late final String category;
  late final String venue;
  late final String startTime;
  late final String startDate;
  late final String endTime;
  late final String endDate;
  late final String earlyBirdEconomyPrice;
  late final String earlyBirdEconomySeat;
  late final String economyPrice;
  late final String economicSeat;
  late final String vip;
  late final String vipSeat;
  late final String earlyBirdVipPrice;
  late final String earlyBirdVipSeat;
  late final String earlyBirdPriceDateLimit;
  late final String country;
  late final String state;
  late final String city;
  late final String email;
  late final String website;
  late final String radio;
  late final String type;
  late final String phone;
  late final String disclaimer;
  late final String latitude;
  late final String longitude;
  late final String liveDead;
  late final String image_object;
  late final String organizer_imgae_object;
  late final String id;
  late final String event_id;

  EventModel({
    required this.title,
    required this. description,
    required this. category,
    required this. venue,
    required this. startTime,
    required this. startDate,
    required this. endTime,
    required this. endDate,
    required this. earlyBirdEconomyPrice,
    required this. earlyBirdEconomySeat,
    required this. economyPrice,
    required this. economicSeat,
    required this. vip,
    required this. vipSeat,
    required this. earlyBirdVipPrice,
    required this. earlyBirdVipSeat,
    required this. earlyBirdPriceDateLimit,
    required this. country,
    required this. state,
    required this. city,
    required this. email,
    required this. website,
    required this. radio,
    required this. type,
    required this. phone,
    required this. disclaimer,
    required this. latitude,
    required this. longitude,
    required this. liveDead,
    required this. image_object,
    required this. organizer_imgae_object,
  });
  EventModel.fromDocumentSnapshot({required DocumentSnapshot doc})
  {
    Map<String,dynamic> data=doc.data() as Map<String,dynamic>;
    id=doc.id;
    title=data["title"]??"";
    description=data["description"]??"";
    category=data["category"]??"";
    venue=data["venue"]??"";
    startTime=data["startTime"]??"";
    startDate=data["startDate"]??"";
    endTime=data["endTime"]??"";
    endDate=data["endDate"]??"";
    earlyBirdEconomyPrice=data["earlyBirdEconomyPrice"]??"";
    earlyBirdEconomySeat=data["earlyBirdEconomySeat"]??"";
    economyPrice=data["economyPrice"]??"";
    economicSeat=data["economicSeat"]??"";
    vip=data["vip"]??"";
    vipSeat=data["vipSeat"]??"";
    earlyBirdVipPrice=data["earlyBirdVipPrice"]??"";
    earlyBirdVipSeat=data["earlyBirdVipSeat"]??"";
    earlyBirdPriceDateLimit=data["earlyBirdPriceDateLimit"]??"";
    country=data["country"]??"";
    state=data["state"]??"";
    city=data["city"]??"";
    email=data["email"]??"";
    radio=data["radio"]??"";
    type=data["type"]??"";
    phone=data["phone"]??"";
    disclaimer=data["disclaimer"]??"";
    latitude=data["latitude"]??"";
    longitude=data["longitude"]??"";
    liveDead=data["liveDead"]??"";
    image_object=data["image_object"]??"";
    organizer_imgae_object=data["organizer_imgae_object"]??"";
    event_id=data["event_id"]??"";

  }
}