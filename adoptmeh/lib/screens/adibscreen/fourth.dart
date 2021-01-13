import 'package:flutter/material.dart';


class Fourth extends StatefulWidget {
  @override
  _FourthState createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Profile"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// making top section of app where we are showing avator and text
              Container(
                height: size.height * 0.3,
                width: size.width,
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Users",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),

              /// text for choosing information of pets
              Text(
                "You have adopt ?number? of pets",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),

              Padding(
                padding: EdgeInsets.all(6),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.blue[300],
                      height:
                          size.height * 0.32, //kasi height dia tak tinggi sgt
                      width: double.infinity,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.blue[300],
                      height: size.height * 0.32,
                      width: double.infinity,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
