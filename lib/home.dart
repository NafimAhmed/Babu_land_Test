


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget{



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map <String, dynamic>? apiMap;



  Map<String, String> get headers => {
    "MOBILE_NUMBER": "01717956094",
  };

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms'),headers: headers
    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    //print(list?.length);
  }

  @override
  Widget build(BuildContext context) {


    getUserData();
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("rfk;fk"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          ListView.builder(
            shrinkWrap: true,
            itemCount: apiMap!['items'].length,
              itemBuilder:(BuildContext context, int index){

            return Container(

              child: Column(
                children: [
                  Text("This is your Entry Ticket",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                  ),

                  Text("Order ID: ${apiMap!['items'][index]['pk']}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),

                  Text("Ticket Price: ${apiMap!['items'][index]['total']}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),


                  Text(" Purchase Date  ${apiMap!['items'][index]['sell_date']}",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),




                ],
              ),

            );

          }
          ),

        ],
      ),
    );
  }

  @override
  void initState() {

    getUserData();
    // TODO: implement initState
    super.initState();
  }



}