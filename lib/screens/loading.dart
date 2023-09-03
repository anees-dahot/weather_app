import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  TextEditingController search = TextEditingController();
  late Worker worker;

  Future<void> startApp() async {
    worker = Worker('indore'); // Initialize the Worker instance
    await worker.getData();
    print('Icon Name: ${worker.icon}');
  }

  @override
  void initState() {
    super.initState();
    // worker = Worker('hyderabad');
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade300,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: startApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a progress indicator while waiting for the API
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Expanded(
                      child: Column(
                        children: [
                         const Padding(
                           padding: EdgeInsets.all(50.0),
                           child: CircularProgressIndicator(),
                         ),
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          Container(
                              width: 400,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(58, 255, 255, 255)),
                              child: const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20.0),
                                      child: CircularProgressIndicator(),
                                    )
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 150,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(58, 255, 255, 255)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(50.0),
                                    child: CircularProgressIndicator(),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                               Container(
                                  width: 150,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(58, 255, 255, 255)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(50.0),
                                    child: CircularProgressIndicator(),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Row(
                            children: [
                              Container(
                                  width: 150,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(58, 255, 255, 255)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(50.0),
                                    child: CircularProgressIndicator(),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                               Container(
                                  width: 150,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(58, 255, 255, 255)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(50.0),
                                    child: CircularProgressIndicator(),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text(
                                      ('Made By Anees'),
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Display an error message if there's an error
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display data when API call is complete
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                          worker.location.toString(),
                          style: GoogleFonts.nunito(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: 400,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(58, 255, 255, 255)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    'https://openweathermap.org/img/wn/${worker.icon}.png',
                                  ),
                                  const SizedBox(width: 20,),
                                  Text(
                                    (worker.description.toString()),
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                width: 150,
                                height: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(58, 255, 255, 255)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset('assets/temperature.png',
                                        width: 50, height: 50),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        (worker.temp.toString())
                                            .substring(0, 4) + '°',
                                        style: GoogleFonts.oswald(
                                            fontSize: 40,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    )
                                  ],
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                             Container(
                                width: 150,
                                height: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(58, 255, 255, 255)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset('assets/humidity.png',
                                        width: 50, height: 50),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        (worker.humidity.toString())
                                             + '%',
                                        style: GoogleFonts.oswald(
                                            fontSize: 40,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Row(
                          children: [
                            Container(
                                width: 150,
                                height: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(58, 255, 255, 255)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset('assets/pressure.png',
                                        width: 50, height: 50),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        (worker.pressure.toString())
                                            .substring(0, 3),
                                        style: GoogleFonts.oswald(
                                            fontSize: 40,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    )
                                  ],
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                             Container(
                                width: 150,
                                height: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(58, 255, 255, 255)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset('assets/air.png',
                                        width: 50, height: 50),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        (worker.air_speed.toString())
                                             + '%',
                                        style: GoogleFonts.oswald(
                                            fontSize: 40,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text(
                                    ('Made By Anees'),
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
