import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';

class Adopt {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference animalCollection =
      FirebaseFirestore.instance.collection("animals");
  final AuthService _auth = AuthService();

  Future getNameFromFirestore() async {
    var name;
    await userCollection
        .where("uid", isEqualTo: _auth.getuid())
        .get()
        .then((value) {
      value.docs.forEach((result) {
        name = (result.data()["name"].toString());
      });
    });
    return name;
  }

  void resetAdoption(String animalname) async{
     animalCollection
        .doc(animalname)
        .update({"owner": "", "adopted": false}).then((_) {
      print("Success!");
    });
  }

  void updateAdoption(bool adopted, String animalname) async {
    String owner;
    await userCollection
        .where("uid", isEqualTo: _auth.getuid())
        .get()
        .then((value) {
      value.docs.forEach((result) {
        owner = (result.data()["name"].toString());
        print(owner);
        print(animalname);
      });
    }); // Gets the name from uid.

    animalCollection
        .doc(animalname)
        .update({"owner": owner, "adopted": adopted}).then((_) {
      print("Success!");
    });
  }

  void addAnimal(String id,String species, String location, String age,
  String gender, String condition, String description) async {
    animalCollection.doc(id).set({
      "owner": "",
      "species": species,
      "location": location,
      "name": id,
      "age": age,
      "gender": gender,
      "condition": condition,
      "adopted": false,
      "description": description,
      "url": "",
    });
  }
}
