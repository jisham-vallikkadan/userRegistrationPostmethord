import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginapipostmethord/apiclass.dart';
import 'package:loginapipostmethord/deatilspage.dart';
import 'package:loginapipostmethord/widgets/buttons.dart';
import 'package:loginapipostmethord/widgets/fiels.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  ApiClient apiClient = ApiClient();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController Emailcontoler = TextEditingController();
  TextEditingController Passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff5AEAD0FF),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Field(
                    obscureText: false,
                    hinttext: 'Enter email',
                    labeltext: 'Email',
                    controller: Emailcontoler),
                Field(
                  obscureText: true,
                  hinttext: 'Enter password',
                  labeltext: 'Password',
                  controller: Passwordcontroler,
                ),
                Buttons(
                    buttonclik: () {
                      // setState(() {
                      //   apiClient.loginuser({
                      //     "username": Emailcontoler.text,
                      //     "password": Passwordcontroler.text,
                      //
                      //   },);
                      //
                      //
                      // });
                      // if(Emailcontoler.text==''||Passwordcontroler.text==""){
                      //   Fluttertoast.showToast(msg: 'Enter values');
                      // }else{
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => Detailspage(token: '116'),));
                      // }
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Detailspage(token: '113'),));

                      loginuser();
                    },
                    buttonleftmatgin: 50,
                    buttonrightmargin: 50,
                    buttontext: 'Login',
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    buttontextcolor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future loginuser() async {
    var data = {
      "username": Emailcontoler.text,
      "password": Passwordcontroler.text,
    };
    var uri = 'https://maitexa.in/water-delivery-api/api/login';
    var responce = await http.post(Uri.parse(uri), body: data);
    var body = jsonDecode(responce.body);
    print(body);
    print(body['success']);
    var token = body['loginid'];
    if (body['success'] == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailspage(token: token.toString()),
          ));
      print('fdxfgd');
    } else {
      Fluttertoast.showToast(msg: 'enter currect value');
    }
  }
}
