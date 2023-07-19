


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class Page2 extends StatefulWidget{



  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {


  Map <String, dynamic>? apiMap;



  Map<String, String> get headers => {
    "ORDER_ID": "94397",
  };

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt'),headers: headers
    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    //print(list?.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tickets",
          style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700
          ),
        ),

      ),
      body: Column(
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