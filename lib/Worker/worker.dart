
import 'package:http/http.dart';
import 'dart:convert';

class worker{


  String location;

  worker({ required this.location }) {
    location = location;
  }
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;




Future<void> getData() async {

  try{
    Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=YOURAPIKEY"));
    Map data = jsonDecode(response.body);


    Map tempData = data['main'];
    Map wind = data['wind'];
    double getAirSpeed = wind["speed"] / 0.2777777778;
    String getHumidity = tempData['humidity'].toString();
    double getTemp = tempData['temp'] - 273.15;


    List weatherData = data['weather'];
    Map weatherMainData = weatherData[0];
    String getmainDes = weatherMainData['main'];
    String getDesc = weatherMainData['description'];


    temp = getTemp.toString();
    humidity = getHumidity;
    air_speed = getAirSpeed.toString();
    description = getDesc;
    main = getmainDes;
    icon = weatherMainData["icon"];
  }catch(e){

    print(e);

    temp = "NA";
    humidity = "NA";
    air_speed = "NA";
    description = "Can't find data";
    main = "Error Occurred";
    icon = "03n";

  }


}


}
