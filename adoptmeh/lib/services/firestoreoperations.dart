import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';

class Adopt {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference animalCollection =
      FirebaseFirestore.instance.collection("animals");
  final AuthService _auth = AuthService();

  void updateAdoption(bool adopted, String animalname) async {
    String owner;
    await userCollection
        .where("uid", isEqualTo: _auth.getuid())
        .get()
        .then((value) {
      value.docs.forEach((result) {
        owner = (result.data()["name"]);
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
   void addAnimal (String id) async{
      animalCollection.doc(id).set({
        "owner": "",
        "species": "",
        "location": "",
        "name":"",
        "age": "",
        "gender": "",
        "condition": "",
        "adopted": false,
        "description": "",
        "url":"",
      });
    }
}
