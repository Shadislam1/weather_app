import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }
  Future getCurrentWeather() async {
    String cityName = 'London';

   final res = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey',
      ),
    );
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ) 
        ) ,
        centerTitle: true,
        actions:  [
       IconButton(onPressed: (){},
       icon: const Icon(Icons.refresh),
       ),
        ],
      ),
      // shad
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //main card 
        SizedBox(
          
          width: double.infinity,
          child: Card(
            elevation: 10,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),

            child:ClipRRect(
              child: BackdropFilter (
                filter:ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: const Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '300k',  
                        style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                       SizedBox(height: 16,),
                      Icon(Icons.cloud,
                      size: 64
                      ),
                      Text(
                        'Rain',
                        style: TextStyle(
                          fontSize:20,
                           ),
                          ),
                    ]
                    ),
                ),
              ),
            ),
              ),
        ),
          const SizedBox(height: 16),
          
          
             const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
              
              ),

              const SizedBox(height: 8),
            const  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    
                      
                       
                               HourlyForcastItem(
                                time: '03:00',
                                icon: Icons.cloud,
                                temperature: '320.12',
                               ), 
                               HourlyForcastItem(
                                time: '03:10',
                                icon: Icons.sunny,
                                temperature: '320.20',
                               ), 
                               HourlyForcastItem(
                                time: '03:30',
                                icon: Icons.cloud,
                                temperature: '320.21',
                               ), 
                               HourlyForcastItem(
                                time: '03:40',
                                icon: Icons.nightlife,
                                temperature: '320.31',
                               ), 
                               HourlyForcastItem(
                                time: '03:50',
                                icon: Icons.cloud,
                                temperature: '320.41',
                               ), 
                               
                       // another card used
                      
                      // shad
                    
                  ],
                ),
              ),
          
          //weather forecast cards

         
          const SizedBox(height: 20),
            const Text(
              'Additional Information',
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
              
              ),
              //shad11
            const SizedBox(height: 16.0),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: 'Humditiy',
                  value: '91',
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: 'Air',
                  value: '7.5',

                ),
                AdditionalInfoItem(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1000',
                ),
                

                  
              
                  
               
              ],
            )

           // shad11
        ],
        ),
      ),
      //shad
    );
  }
}


