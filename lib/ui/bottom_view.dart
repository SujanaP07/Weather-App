import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
           separatorBuilder:(context,index)=>SizedBox(width:8.0),
           itemCount:forecastList.length,
           itemBuilder:(context,index)=>ClipRRect(
             borderRadius:BorderRadius.all(Radius.circular(10.0)),
             child:Container(
               width:MediaQuery.of(context).size.width/2.7,
               height:160.0,
               child:ForecastCard(snapshot,index),
             )
         )
       ),
       ),
     ]
   )
 );
}