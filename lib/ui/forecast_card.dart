import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/util/forecast_util.dart';
import 'package:weather_app/util/weather_icon.dart';

Widget forecastCard(AsyncSnapshot<ForecastModel>snapshot,int index)
{
  var forecastList=snapshot.data.list;
  var dayOfWeek="";
  DateTime date=new DateTime.fromMillisecondsSinceEpoch((forecastList[index].dt*1000).toInt());
  var fullDate=ForecastUtil.getDateFormat(date);
  dayOfWeek=fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child:Text(dayOfWeek)),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 33.0,
            child:getWeatherIcon(forecastList[index].weather[0].main,45)
          ),
          Container(child:Column(
            children: [
               Row(
                   children:[
                  Icon(FontAwesomeIcons.temperatureHigh),
                  Text("${forecastList[index].main.tempMax.toStringAsFixed(0)}F")
                ]
              ),
              Row(
                  children:[
                    Icon(FontAwesomeIcons.temperatureLow),
                    Text("${forecastList[index].main.tempMin.toStringAsFixed(0)}F")
                  ]
              ),
              Row(
                  children:[
                    Icon(FontAwesomeIcons.water),
                    Text("${forecastList[index].main.humidity.toStringAsFixed(0)}%")
                  ]
              ),
              Row(
                  children:[
                    Icon(FontAwesomeIcons.wind),
                    Text("${forecastList[index].wind.speed.toStringAsFixed(1)}km/hr")
                  ]
              ),
            ],
          ),
            padding: EdgeInsets.only(left:8.0),
          ),
        ],
      ),
    ],
  );
}