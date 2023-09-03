import 'package:flutter/material.dart';
import '../worker/worker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<String> pakistaniCities = [
  'Sukkur',
  'Sanghar',
  'Dadu',
  'Shikarpur',
  'Khairpur',
  'Jacobabad',
  'Naushahro Feroze',
  'Mirpur Mathelo',
  'Tando Adam',
  'Badin',
  'Tando Allahyar',
  'Mirpur Bathoro',
  'Umerkot',
  'Kandhkot',
  'Larkana',
  'Thatta',
  'Ratodero',
  'Hyderabad',
  'Ghotki',
  'Nawabshah',
  'Sujawal',
  'Matiari',
  'Kotri',
  'Daharki',
  'Sehwan',
  'Jamshoro',
  'Qambar',
  'Moro',
  'Sakrand',
  'Warah',
  // Add more cities here
];

  

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    late Worker worker;
   
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(worker.air_speed.toString()),
          
        ],
      ),
    );
  }
}




