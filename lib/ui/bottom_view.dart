import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:weather_app/model/forecast_model.dart';


Widget bottomView(AsyncSnapshot<ForecastModel>snapshot,BuildContext context){
 var forecastList=snapshot.data.list;
 return Container(
   child:Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children:[
       Text("5 DAY WEATHER FORECAST",
         textAlign: TextAlign.center,
         style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
       ),
       Container(
         padding:EdgeInsets.symmetric(vertical:16.0, horizontal:20.0),
         child:ListView.separated(
           
         )
       )
     ]
   )
 );
}