import 'package:flutter/material.dart';

const textboxdecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
);

class AnimalWidget extends StatefulWidget {
  @override
  _AnimalWidgetState createState() => _AnimalWidgetState();
}

class _AnimalWidgetState extends State<AnimalWidget> {
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
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
    );
  }
}
