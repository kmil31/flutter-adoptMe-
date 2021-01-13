import 'second.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /// making app bar of first page
      appBar: AppBar(
        backgroundColor: Color(0xFF23252E),
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        title: Text("Adopt Me"),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),

      /// body of screen start from here
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// showing heading
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Hedgehog (Oyen)",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: size.height * 0.25,
              width: size.width,
              child: Image.asset(
                "assets/img.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// making body text start here

                SizedBox(
                  height: 30,
                ),
                BodyText(
                  text1: "owner: ",
                  text2: "Muhammad Adib",
                ),
                BodyText(
                  text1: "Species: ",
                  text2: "Amur Hedgehog",
                ),
                BodyText(
                  text1: "Location: ",
                  text2: "Sarikei, Sarawak",
                ),
                BodyText(
                  text1: "Age: ",
                  text2: "2 weeks",
                ),
                BodyText(
                  text1: "Jantina: ",
                  text2: "Female",
                ),
                BodyText(
                  text1: "Condition: ",
                  text2: "No sickness",
                ),
                // BodyText(text1: "Description: ",text2:"This hedgehog cannot dance, pls adopt it so i can find another hedgehog( that can dane obviously) while not making it jealous"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Description: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "This hedgehog cannot dance, pls adopt it so i can find another hedgehog( that can dane obviously) while not making it jealous",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),

                /// making 2 buttons here
                Container(
                  height: 50,
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(2)),
                        alignment: Alignment.center,
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          /// this is navigation class for moving 1st class to another class
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignIn2()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(2)),
                          child: Text("Apply Now"),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

/// this is body text widget for showing body text
class BodyText extends StatelessWidget {
  final String text1, text2;
  BodyText({this.text1, this.text2});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$text1",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$text2",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
