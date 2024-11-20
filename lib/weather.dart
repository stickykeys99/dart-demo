import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

void main() async {
  var env = DotEnv()..load();

  for (var key in ['API_KEY', 'LAT', 'LON']) {
    if (!env.isDefined(key)) {
      print('$key not found in .env.');
      print('Exiting.');
      return;
    }
  }

  var apiKey = env['API_KEY'];
  var lat = env['LAT'];
  var lon = env['LON'];

  var url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

  http.Response res;

  try {
    res = await http.get(Uri.parse(url));
  } catch (e) {
    print(e);
    return;
  }

  if (res.statusCode == 200) {
    Map body;
    try {
      body = jsonDecode(res.body);
    } catch (e) {
      print(e);
      return;
    }
    print('Weather: ${body['weather']?[0]['description']}');
    print('Temperature: ${body['main']?['temp']}°C');
    print('Cloudiness: ${body['clouds']?['all']}%');
    print('Wind speed: ${body['wind']?['speed']}m/s');
    print('City: ${body['name']}');
    return;
  }
  print('Error with status code ${res.statusCode} and body ${res.body}');
}
