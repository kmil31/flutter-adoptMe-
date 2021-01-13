import 'dart:ui';

import 'package:flutter/material.dart';


import 'fourth.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /// making app bar for 3rd class
      appBar: AppBar(
        backgroundColor: Color(0xFF23252E),
        title: Text("Adoption"),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Adoption",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Material(
                child: Container(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Column(
                    children: [
                      /// displaying image
                      InkWell(
                       
                          child: Image.asset(
                            "assets/im.jpg",
                            fit: BoxFit.cover,
                            height: size.height * 0.3,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              /// making text below the image

                              Text(
                                "27",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Fri",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// text related the image
                              Text(
                                "British Shorthair Cats",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Ipoh, Perak",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text('Age: 4 months'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.4,
                width: size.width,
                child: Column(
                  children: [
                    InkWell(
                        
                        child: Image.asset(
                          "assets/im.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.3,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "28", //the date
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              //spacing
                              height: 6,
                            ),
                            Text(
                              "Sat", //the date
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HedgeHog",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Skudai, Johor",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text('Age: 3 months'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fourth()));
                },
                child: Container(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/im.jpg",
                        fit: BoxFit.cover,
                        height: size.height * 0.3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "29",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Sun",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "British Shorthair",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Wangsa Maju, Selangor",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text('Age: 4 months'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
