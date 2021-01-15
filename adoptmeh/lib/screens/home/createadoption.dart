import 'package:adoptmeh/services/firestoreoperations.dart';
import 'package:flutter/material.dart';
import 'package:adoptmeh/shared/constants.dart';

class createAdoption extends StatefulWidget {
  @override
  _createAdoptionState createState() => _createAdoptionState();
}

class _createAdoptionState extends State<createAdoption> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String species;
  String location;
  String age;
  String gender;
  String condition;
  String description;
  Adopt adopt = new Adopt();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Put up an animal for adoption"),
        ),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: textboxdecoration.copyWith(hintText: "ID"),
                validator: (value) => value.isEmpty ? 'Enter an ID' : null,
                onChanged: (value) {
                  id = value;
                },
              ),
               TextFormField(
                decoration: textboxdecoration.copyWith(hintText: "Species"),
                validator: (value) => value.isEmpty ? 'Enter the Species' : null,
                onChanged: (value) {
                  species = value;
                },
              ),
               TextFormField(
                decoration: textboxdecoration.copyWith(hintText: "Location"),
                validator: (value) => value.isEmpty ? 'Enter a location' : null,
                onChanged: (value) {
                  location = value;
                },
              ),
               TextFormField(
                decoration: textboxdecoration.copyWith(hintText: "Age"),
                validator: (value) => value.isEmpty ? 'Enter the age' : null,
                onChanged: (value) {
                  age = value;
                },
              ),
               TextFormField(
                decoration: textboxdecoration.copyWith(hintText: "Gender"),
                validator: (value) => value.isEmpty ? 'Enter a gender' : null,
                onChanged: (value) {
                  gender = value;
                },
              ),
               TextFormField(
                decoration: textboxdecoration.copyWith(hintText: "Condition"),
                validator: (value) => value.isEmpty ? 'Enter the condition' : null,
                onChanged: (value) {
                  condition = value;
                },
              ),
               TextFormField(
                decoration: textboxdecoration.copyWith(hintText: "Description"),
                validator: (value) => value.isEmpty ? 'Enter the description' : null,
                onChanged: (value) {
                  description = value;
                },
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Put up an adoption post",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    adopt.addAnimal(id,species,location,age,gender,condition,description);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
