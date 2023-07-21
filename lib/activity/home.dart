import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weath/activity/Loading.dart';
import 'package:http/http.dart';
import 'package:weath/Worker/worker.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp = ((info?['temp_value']).toString());
    String air = ((info?['air_speed_value']).toString());
    if(temp == "NA"){
      print("NA");
    }
    else{
       temp = ((info?['temp_value']).toString()).substring(0, 4);
       air = ((info?['air_speed_value']).toString()).substring(0, 4);
    }


    String icon = info?['icon_value'] ?? '';
    String getCity = info?['city_value'] ?? '';
    String hum = info?['hum_value']?? '';

    String des = info?['desc_value']?? '';


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.blue[800]!,
                Colors.blue[300]!,
              ])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if((search.text).replaceAll(" ", "") == ""){
                          print("Blank search");
                        }else{

                          Navigator.pushReplacementNamed(context, "/Loading", arguments:
                          {
                            "search_text" : search.text,
                          } );
                        }



                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ("Search any city Name")),
                      ),
                    ),
                  ],
                ),
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)),
                    margin: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    padding: const EdgeInsets.all(26),
                    child: Row(
                      children: [
                        Image.network(
                            "https://openweathermap.org/img/wn/$icon@2x.png"),
                        Column(

                          children: [
                            SizedBox(width: 130 ),
                            Text(
                              "$des",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "In $getCity",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$temp",
                                  style: TextStyle(fontSize: 80),
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(fontSize: 30),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.day_windy)],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "$air",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("Km/Hr")
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.humidity)],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "$hum",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("%")
                          ],
                        )),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: (Column(
                  children: [
                    Text("Made by Sudhanshu"),
                    Text("Data provided by openweathermap.org")
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
