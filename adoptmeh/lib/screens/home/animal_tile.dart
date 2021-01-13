import 'package:adoptmeh/screens/home/animal_details.dart';
import 'package:flutter/material.dart';
import 'package:adoptmeh/models/animal.dart';

class AnimalTile extends StatelessWidget {
  final Animal animal;
  AnimalTile({this.animal});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0,6.0,20.0,0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blueGrey,
          ),
          title: Text(animal.name),
          subtitle: Text(animal.species),
        ),
      ),
    );*/

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
                      "very cute",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "animal",
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
                      animal.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      animal.species,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                MaterialButton(
                  child: Text("Details"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blueGrey),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AnimalDetails(animal: animal,)));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
