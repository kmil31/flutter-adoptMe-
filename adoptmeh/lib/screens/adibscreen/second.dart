import 'third.dart';
import 'package:flutter/material.dart';

class SignIn2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //create a size
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// making circular avatar for displaying cat image
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Image.asset(
                    "assets/cat.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                // height: size.height*0.1,
                width: size.width * 0.7,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// making name and textfield for that and placing inside hint text as a placeholder
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "UserName:  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "PlaceHolder",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8))),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                // height: size.height*0.1,
                width: size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// making name and password textfield for that and placing inside hint text as a placeholder
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Password:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "password",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Center(
                child: MaterialButton(
                  height: 45,
                  minWidth: 200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.indigo,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Third()));
                  },
                  child: Text("Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
