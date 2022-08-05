import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatelessWidget {
  String? heading;
  String? body;
  final item;

  News({required this.heading, required this.body, context,required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Hero(
                  tag:item,

                  child: Image.network(
                    'https://source.unsplash.com/random?monochromatic+dark',
                    fit: BoxFit.cover,
                    
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red.shade200,
                width: double.infinity,

                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
        
                    crossAxisAlignment: CrossAxisAlignment.start,
                  
                    children: [
                      Text(heading.toString(),style: GoogleFonts.lato(
                        fontSize: 30,
                          fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(height: 10),
                      Text(body.toString(),
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ],

                  ),
                ),

              ),
            ),
          ],
        ));
  }
}
