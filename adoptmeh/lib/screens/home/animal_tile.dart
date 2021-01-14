import 'package:adoptmeh/screens/home/animal_details.dart';
import 'package:flutter/material.dart';
import 'package:adoptmeh/models/animal.dart';

class AnimalTile extends StatelessWidget {
  final Animal animal;
  AnimalTile({this.animal});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
 

    return Material(
      child: Padding(
        padding: EdgeInsets.only(bottom: .0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff607d8b), Colors.lightBlueAccent]),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset(0, 3),
                )
              ]),
          height: size.height * 0.4,
          width: size.width,
          child: Column(
            children: [
              /// displaying image
              InkWell(
                  child: Image.network(
                animal.url,
                fit: BoxFit.cover,
                height: size.height * 0.3,
              )),

              Container(
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.green[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        /// making text below the image
                        ///
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "very cute",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[800],
                            fontFamily: 'Open Sans',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        Text(
                          "animal",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 25,
                            fontFamily: 'Open Sans',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 2,
                      height: 50,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// text related the image
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          animal.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          animal.species,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    MaterialButton(
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      color: Color(0xfffdd835),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.blueGrey),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnimalDetails(
                                      animal: animal,
                                    )));
                      },
                    )
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
