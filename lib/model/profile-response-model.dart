// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) =>
    ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) =>
    json.encode(data.toJson());

class ProfileResponseModel {
  final int id;
  final dynamic title;
  final String firstName;
  final String lastName;
  final dynamic companyName;
  final dynamic dob;
  final dynamic vatNo;
  final int accessType;
  final dynamic meta;
  final int points;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic profileImage;
  final dynamic coverImage;

  ProfileResponseModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.dob,
    required this.vatNo,
    required this.accessType,
    required this.meta,
    required this.points,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImage,
    required this.coverImage,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        id: json["id"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        companyName: json["company_name"],
        dob: json["dob"],
        vatNo: json["vat_no"],
        accessType: json["access_type"],
        meta: json["meta"],
        points: json["points"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profileImage: json["profile_image"],
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "first_name": firstName,
        "last_name": lastName,
        "company_name": companyName,
        "dob": dob,
        "vat_no": vatNo,
        "access_type": accessType,
        "meta": meta,
        "points": points,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile_image": profileImage,
        "cover_image": coverImage,
      };
}
