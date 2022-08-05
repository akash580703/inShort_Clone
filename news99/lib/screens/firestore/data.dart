

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';




class Data  {

  final String id;
  final String name;



  Data({
    required this.id,
    required this.name,
  

  });

  factory Data.fromJson({
    required String id,
    required Map<String, dynamic> json,
  }) {
    print(json);

    return Data(
      id: id,
      name: json['name'],

    );


  }



  Map<String, String> toJson() => {
        'id': id,
        'name': name,
 
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

 
}




