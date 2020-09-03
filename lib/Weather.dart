import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/network/network.dart';
import 'package:weather_app/ui/bottom_view.dart';
import 'package:weather_app/ui/forecast_ui.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather>{
  String cityName;
  Future<ForecastModel>dat;
  Future<ForecastModel> getData()async{
    var data;
    var n=new Network();
    data=n.getWeather(city:cityName);
    return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dat=getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Weather Forecast"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: ()=>debugPrint("Menu"),
          )
        ],
      ),
      body:ListView(
        padding: EdgeInsets.all(10.0),
          children: [
            Text(" "),
            TextField(
                keyboardType: TextInputType.text,
                decoration:InputDecoration(
                  hintText: "Enter City Name",
                  prefixIcon: Icon(Icons.search,color: Colors.amber,),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  contentPadding: EdgeInsets.all(2.0),
                ),
              onSubmitted: (value){
                  setState(() {
                    cityName=value;
                    dat=new Network().getWeather(city:cityName);
                  });
                  },
            ),
              FutureBuilder(
                future:getData(),
                builder:(BuildContext context,AsyncSnapshot<ForecastModel>snapshot){
                  if(snapshot.hasData) {
                    return Container(
                        child: Column(
                          children: [
                            createMidView(snapshot),
                            bottomView(snapshot, context),
                          ],
                        )
                    );
                  }
                  else
                    return Container(child:Center(child:CircularProgressIndicator(backgroundColor: Colors.amber,)));
                }
              ),
          ],
          )
        );
  }


}
