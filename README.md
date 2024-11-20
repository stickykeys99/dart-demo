This is a demo of the Dart programming language. 

There are 3 programs written for this demo, all under `/lib`:
```
oo.dart
calc.dart
weather.dart
```

Run any of them in the command line:
```
dart run lib/<file_name>
```

For the weather routine, get a free API key from https://openweathermap.org/. 

Then, get the lat & long coordinates for your city.  

Then, create a new .env file using the following: 
```
dart pub global activate dotenv
dart pub global run dotenv:new
```

Finally, in the generated `.env` file, paste the following:
```
API_KEY=<your_api_key>
LAT=<your_lat>
LONG=<your_long>
```