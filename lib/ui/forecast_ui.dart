import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/util/forecast_util.dart';
import 'package:weather_app/util/weather_icon.dart';

Widget createMidView(AsyncSnapshot<ForecastModel>snapshot)
{
  var forecastList=snapshot.data.list;
  Container midView=Container(
    padding: EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${snapshot.data.city.name},${snapshot.data.city.country}",
        textDirection:TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold
        ),
        ),
        Text("${ForecastUtil.getDateFormat(
            new DateTime.fromMillisecondsSinceEpoch((forecastList[0].dt*1000).toInt()))}"
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child:Center(
            child:getWeatherIcon(forecastList[0].weather[0].main,150.0)
        ),
          height:170.0,
          width: 170.0,
        ),
        Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Text("${forecastList[0].main.temp.toStringAsFixed(0)}°F ",style:TextStyle(fontSize: 34.0)),
              Text("${forecastList[0].weather[0].description.toUpperCase()}"),
            ],
        ),
        SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(FontAwesomeIcons.wind),
                Text("${forecastList[0].wind.speed.toStringAsFixed(1)} km/hr")
              ],
            ),
            Column(
              children: [
                Icon(FontAwesomeIcons.water),
                Text("${forecastList[0].main.humidity.toStringAsFixed(0)}%")
              ],
            ),
            Column(
              children: [
                Icon(FontAwesomeIcons.temperatureHigh),
                Text("${forecastList[0].main.tempMax.toStringAsFixed(1)}°F")
              ],
            )
          ],
        ),
      ],
    ),
  );
  return midView;
}