import 'package:intl/intl.dart';

class ForecastUtil
{
  static String APPID="594e3948fa8b82837026c83b11f018b5";
  static String getDateFormat(DateTime dateTime){
    return new DateFormat("EEE, MM d, y").format(dateTime);
  }
}