import 'package:center/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOn extends StatelessWidget {
String? password;
  GlobalKey<FormState> FormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        color: Colors.blue[90],
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 50,
        ),
        child: ListView(
          children: [
            Stack(
alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [Positioned(
                top: -290,
                
                child: Container(

                height: 350,
                width: 550,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(700)
                  ),
              ),),
                Positioned(child:
                Text(
                  'Log on',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),)
              ],
            ),
            Container(
              height: 500,
              width: 350,
              child: Form(
                  key: FormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            validator: (val) {
                              if (val!.length <= 5)
                                return 'The name should be greater than 5 letters';
                            },
                            onSaved: (val) async{
                              SharedPreferences sharedPreferencesLogin=await SharedPreferences.getInstance();
                              sharedPreferencesLogin.setString('UserName',"$val");
                            },
                            decoration: InputDecoration(
                              labelText: 'Your Name',
                              filled: true,
                              fillColor: Colors.blue[50],
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2)),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            onSaved: (val) async {
                              SharedPreferences sharedPreferencesLogin=await SharedPreferences.getInstance();
                              sharedPreferencesLogin.setString('Email','$val');
                            },validator: (val){
                              if(!val!.contains('@gmail.com'))
                                return 'the Email is not true';
                          },
                            decoration: InputDecoration(
                              labelText: 'Your email',
                              filled: true,
                              fillColor: Colors.blue[50],
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2)),
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            obscureText: true,
                            validator: (val) {
                              if (val!.length <= 8)
                                return 'The password should be greater than 8 letters';
                            },
                            onSaved: (val) async{
                              password=val;
                              SharedPreferences sharedPreferencesLogin=await SharedPreferences.getInstance();
                              sharedPreferencesLogin.setString('Password','$val');
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter PassWord',
                              filled: true,
                              fillColor: Colors.blue[50],
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2)),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            validator: (val)  {
                              FormKey.currentState!.save();

                              if (val != password)
                                return 'The password is not matching';
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirmation PassWord',
                              filled: true,
                              fillColor: Colors.blue[50],
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent, width: 2)),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 230),
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white54, width: 2)),
                          child: MaterialButton(
                            onPressed: () async {
                              if (FormKey.currentState!.validate()) {
                                FormKey.currentState!.save();
                                SharedPreferences? sharedPreferencesLogin=await SharedPreferences.getInstance();
                                sharedPreferencesLogin.setBool('islog',true);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
