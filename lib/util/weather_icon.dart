import 'package:flutter/material.dart';
import'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon(String weatherDes,double size) {
  switch (weatherDes) {
    case "Clear":
      {
        return Icon(FontAwesomeIcons.sun, color:Colors.amber, size: size);
        break;
      }
    case "Clouds":
      {
        return Icon(FontAwesomeIcons.cloud, color:Colors.black45 , size: size);
        break;
      }
    case "Rain":
      {
        return Icon(FontAwesomeIcons.cloudRain, color:Colors.blueGrey, size: size);
        break;
      }
    case "Snow":
      {
        return Icon(FontAwesomeIcons.solidSnowflake, color:Colors.white54, size: size);
        break;
      }
    default:{
      return Icon(FontAwesomeIcons.cloudSunRain,color:Colors.blue,size:size);
      break;
    }

  }
}