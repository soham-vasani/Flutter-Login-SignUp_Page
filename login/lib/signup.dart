import 'package:flutter/material.dart';
import 'package:login/login.dart';

void main() {
//  login signup
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:

      //    SafeArea is a widget that insets its child with sufficient padding to avoid obstacles
      //    SafeArea is insert extra space on screen where camera is placed.

      SafeArea(

        child: SingleChildScrollView(

        //we use form because we nedd validation in textfield
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/fb1.png'),
                  radius: 35,
                ),
              ),
              Container(
                child: Center(
                  child: Text('SignUp',
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                  validator: (value) {
                    print('validation:- ${value}');

                    if (value != null && value.length < 3) {
                      return 'minimum 3 character is required..';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'M.No', border: OutlineInputBorder()),
                    validator: (value) {
                      print('validation:- ${value}');

                      if (value?.length != 10) {
                        return 'minimum 10 digit required.';
                      } else {
                        return null;
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                    validator: (value) {
                      print('validation:- ${value}');

                      if (RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return null;
                      } else {
                        return 'enter valid email id';
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Password', border: OutlineInputBorder()),
                    validator: (value) {
                      print('validation:- ${value}');

                      if (value!.length < 8 || value.length! > 16) {
                        return 'password length must be 8 to 16 character';
                      } else {
                        return null;
                      }
                    }),
              ),
              ElevatedButton(

                //for validation
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      print('valid');
                    } else {
                      print('not valid');
                    }
                  },
                  child: Text('SignUp'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()),
                    );
                  },
                  child: Text('Login',style: TextStyle(color: Colors.blue[900]),)
              )
            ],
          ),
        ),
      ),
    )
    );
  }
}
