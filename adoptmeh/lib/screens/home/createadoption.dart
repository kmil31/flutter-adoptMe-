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
                validator: (value) => value.isEmpty ? 'Enter an email' : null,
                onChanged: (value) {
                  id = value;
                },
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Put up an adoption post",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()  {
                  if (_formKey.currentState.validate()) {
                    adopt.addAnimal(id);
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
