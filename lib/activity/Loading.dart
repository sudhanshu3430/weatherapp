import 'package:flutter/material.dart';
import 'package:weath/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String temp;
  late String desc;
  late String hum;
  late String air_speed;
  late String main;
  late String icon;
  late String city = "Indore";




  void startApp(String city) async{
    worker instance = worker (location: "$city");
    await instance.getData();

    temp = instance.temp;
    desc = instance.description;
    hum = instance.humidity;
    main = instance.main;
    air_speed = instance.air_speed;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context as BuildContext, '/home', arguments:{
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "main_value" : main,
        "desc_value" : desc,
        "icon_value": icon,
        "city_value" : city,
      },);
    });




  }

  @override
  void initState() {



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if(search?.isNotEmpty ?? false){
      city = search?['search_text'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo-removebg-preview.png", width: 240,height: 240,),
            Text("Weather App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            ),
            SizedBox(height: 10,),
            Text("Made by Sudhanshu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
        SizedBox(height: 30,),
        SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],

    );
  }
}
