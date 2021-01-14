import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adoptmeh/models/animal.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference animalCollection =
      FirebaseFirestore.instance.collection("animals");
      
      


 

  Future updateUserData(
      String name,
      String species,
      bool adopted,
      String age,
      String url,
      String description,
      String gender,
      String location,
      String owner,
      String condition) async {
    return await animalCollection.doc(uid).set({
      'name': name,
      'species': species,
      'adopted': adopted,
      'age': age,
      'description': description,
      'gender': gender,
      'location': location,
      'owner': owner,
      'condition': condition,
      'url': url,
    });
  }


  // create an animal list from a snapshot
  List<Animal> _animalListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Animal(
        name: doc.data()['name'] ?? '',
        species: doc.data()['species'] ?? '',
        adopted: doc.data()['adopted'] ?? false,
        age: doc.data()['age'] ?? '',
        description: doc.data()['description'] ?? '',
        gender: doc.data()['gender'] ?? '',
        location: doc.data()['location'] ?? '',
        owner: doc.data()['owner'] ?? '',
        condition: doc.data()['condition'] ?? '',
        url: doc.data()['url'] ?? '',
      );
    }).toList();
  }

// get an animal stream
  Stream<List<Animal>> get animals {
    return animalCollection.snapshots().map(_animalListFromSnapshot);
  }
}
