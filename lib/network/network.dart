import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/util/forecast_util.dart';

class Network{
  // ignore: missing_return
  Future<ForecastModel>getWeather({String city})async{
    var url="http://api.openweathermap.org/data/2.5/forecast?q="+city+"&appid="+ForecastUtil.APPID;
    Response rep=await get(Uri.encodeFull(url));
    print("URL: $url");
    if(rep.statusCode==200) {
      print("Weather data: ${rep.body}");
      return ForecastModel.fromJson(jsonDecode(rep.body));
    }
    else{
      throw Exception("Error getting data");
    }
  }
}