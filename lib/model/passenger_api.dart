// To parse this JSON data, do
//
//     final PassengerModel = PassengerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PassengerModel PassengerModelFromJson(String str) => PassengerModel.fromJson(json.decode(str));

String PassengerModelToJson(PassengerModel data) => json.encode(data.toJson());

class PassengerModel {
  final int totalPassengers;
  final int totalPages;
  final List<Passenger> data;


  PassengerModel({
     required this.totalPassengers,
     required this.totalPages,
     required this.data,
  });


  factory PassengerModel.fromJson(Map<String, dynamic> json) => PassengerModel(
    totalPassengers: json["totalPassengers"],
    totalPages: json["totalPages"],
    data: List<Passenger>.from(json["data"].map((x) => Passenger.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalPassengers": totalPassengers,
    "totalPages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Passenger {
  Passenger({
     required this.id,
     required this.name,
     required this.trips,
     required this.airline,
     required this.v,
  });

  final String id;
  final String name;
  final int trips;
  final List<Airline> airline;
  final int v;

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
    id: json["_id"],
    name: json["name"],
    trips: json["trips"],
    airline: List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": PassengerNameValues.reverse[name],
    "trips": trips,
    "airline": List<dynamic>.from(airline.map((x) => x.toJson())),
    "__v": v,
  };
}

class Airline {
  Airline({
      this.id,
      this.name,
      this.country,
      this.logo,
      this.slogan,
      this.headQuaters,
      this.website,
     this.established,
  });

   int? id;
   String ? name;
   String?  country;
   String?  logo;
   Slogan?  slogan;
   HeadQuaters ? headQuaters;
   Website?  website;
   String? established;

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    slogan: sloganValues.map[json["slogan"]],
    headQuaters: headQuatersValues.map[json["head_quaters"]],
    website: websiteValues.map[json["website"]],
    established: json["established"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": airlineNameValues.reverse[name],
    "country": countryValues.reverse[country],
    "logo": logo,
    "slogan": sloganValues.reverse[slogan],
    "head_quaters": headQuatersValues.reverse[headQuaters],
    "website": websiteValues.reverse[website],
    "established": established,
  };
}

enum Country { TAIWAN }

final countryValues = EnumValues({
  "Taiwan": Country.TAIWAN
});

enum HeadQuaters { THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN }

final headQuatersValues = EnumValues({
  "376, Hsin-Nan Rd., Sec. 1, Luzhu, Taoyuan City, Taiwan": HeadQuaters.THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN
});

enum AirlineName { EVA_AIR }

final airlineNameValues = EnumValues({
  "Eva Air": AirlineName.EVA_AIR
});

enum Slogan { SHARING_THE_WORLD_FLYING_TOGETHER }

final sloganValues = EnumValues({
  "Sharing the World, Flying Together": Slogan.SHARING_THE_WORLD_FLYING_TOGETHER
});

enum Website { WWW_EVAAIR_COM }

final websiteValues = EnumValues({
  "www.evaair.com": Website.WWW_EVAAIR_COM
});

enum PassengerName { JOHN_DOE }

final PassengerNameValues = EnumValues({
  "John Doe": PassengerName.JOHN_DOE
});

class EnumValues<T> {
 late  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}




























// class PassengerModel {
//   final int totalPassengers;
//   final int totalPages;
//   final List<Data> data;
//
//   PassengerModel({
//     required this.totalPassengers,
//     required this.totalPages,
//     required this.data,
//   });
//
//   static PassengerModel fromJson(Map<String, dynamic> json) {
//     // totalPassengers = json['totalPassengers'];
//     // totalPages = json['totalPages'];
//     // if (json['data'] != null) {
//     //   data = <Data>[];
//     //   json['data'].forEach((v) {
//     //     data!.add(new Data.fromJson(v));
//     //   });
//     return PassengerModel(
//         totalPassengers: json['totalPassengers'],
//         totalPages: json['totalPages'],
//         data: json['data'].forEach((v) {
//            (Data.fromJson(v));}));
//     // data: json['data'].forEach((v) {
//     //        data.add(Data.fromJson(v));}));
//   }
//
// }
//
// // Map<String, dynamic> toJson() {
// //   final Map<String, dynamic> data = new Map<String, dynamic>();
// //   data['totalPassengers'] = this.totalPassengers;
// //   data['totalPages'] = this.totalPages;
// //   if (this.data != null) {
// //     data['data'] = this.data!.map((v) => v.toJson()).toList();
// //   }
// //   return data;
// // }
//
// class Data {
//   final String sId;
//   final String name;
//   final int trips;
//   final List<Airline> airline;
//   final int iV;
//
//   Data({
//     required this.sId,
//     required this.name,
//     required this.trips,
//     required this.airline,
//     required this.iV,
//   });
//
//   static Data fromJson(Map<String, dynamic> json) {
//     // sId = json['_id'];
//     // name = json['name'];
//     // trips = json['trips'];
//     // if (json['airline'] != null) {
//     //   airline = <Airline>[];
//     //   json['airline'].forEach((v) {
//     //     airline!.add(new Airline.fromJson(v));
//     //   });
//     // }
//     // iV = json['__v'];
//     return Data(
//         sId: json['_id'],
//         name: json['name'],
//         trips: json['trips'],
//         airline: json['airline'].forEach((v) {
//             (Airline.fromJson(v));}),
//         iV: json['iV']);
//   }
//
// // Map<String, dynamic> toJson() {
// //   final Map<String, dynamic> data = new Map<String, dynamic>();
// //   data['_id'] = this.sId;
// //   data['name'] = this.name;
// //   data['trips'] = this.trips;
// //   if (this.airline != null) {
// //     data['airline'] = this.airline!.map((v) => v.toJson()).toList();
// //   }
// //   data['__v'] = this.iV;
// //   return data;
// // }
// }
//
// class Airline {
//   final int id;
//   final String name;
//   final String country;
//   final String logo;
//   final String slogan;
//   final String headQuaters;
//   final String website;
//   final String established;
//
//   Airline(
//       {required this.id,
//       required this.name,
//       required this.country,
//       required this.logo,
//       required this.slogan,
//       required this.headQuaters,
//       required this.website,
//       required this.established});
//
//   static Airline fromJson(Map<String, dynamic> json) {
//     // id = json['id'];
//     // name = json['name'];
//     // country = json['country'];
//     // logo = json['logo'];
//     // slogan = json['slogan'];
//     // headQuaters = json['head_quaters'];
//     // website = json['website'];
//     // established = json['established'];
//     return Airline(
//         id: json['id'],
//         name: json['name'],
//         country: json['country'],
//         logo: json['logo'],
//         slogan: json['slogan'],
//         headQuaters: json['head_quaters'],
//         website: json['website'],
//         established: json['established']);
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['country'] = this.country;
//   //   data['logo'] = this.logo;
//   //   data['slogan'] = this.slogan;
//   //   data['head_quaters'] = this.headQuaters;
//   //   data['website'] = this.website;
//   //   data['established'] = this.established;
//   //   return data;
//   // }
// }
