// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DataModel {
  String name;
  String image;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.image,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJSON(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        image: json['img'],
        price: json['price'],
        people: json['people'],
        stars: json['stars'],
        description: json['description'],
        location: json['location']);
  }
}
