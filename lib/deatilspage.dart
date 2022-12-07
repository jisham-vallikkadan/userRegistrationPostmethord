import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginapipostmethord/loginpage.dart';
import 'package:loginapipostmethord/main.dart';
import 'package:http/http.dart' as http;
import 'package:loginapipostmethord/widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detailspage extends StatefulWidget {
  String token;

  Detailspage({Key? key, required this.token}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  String? name;
  String? place;
  String? number;
  String? email;
  String? post;
  String? pincode;
  String? city;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdetails();
  }

  void getuserdetails() async {
    var url =
        'https://maitexa.in/water-delivery-api/api/get-customer-info/${widget.token}';
    var responce = await http.get(
      Uri.parse(url),
    );
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      // print(body);
      // print(body['customer_info']['email']);
      // print(body['customer_info']['mobile_number']);
      // print(body['customer_info']['pincode']);
      setState(() {
        name = body['customer_info']['name'];
        email = body['customer_info']['email'];
        number = body['customer_info']['mobile_number'];
        place = body['customer_info']['place'];
        pincode = body['customer_info']['pincode'];
        city = body['customer_info']['city'];
        post = body['customer_info']['post'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // appBar: AppBar(
      //   title: Center(child: Text('${name}')),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('images/user-login-icon-14.png'),
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Name :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${name}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Email :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${email}',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Mobile :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${number}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Place :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${place}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Pincode :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${pincode}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'City :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${city}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Post :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${post}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Buttons(
                        buttonclik: () async{


                          SharedPreferences preferncelogout= await SharedPreferences.getInstance();

                            preferncelogout.clear();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Loginpage()), (route) => false);
                        },
                        decoration: BoxDecoration(color: Colors.white),
                        buttonleftmatgin: 100,
                        buttonrightmargin: 100,
                        buttontext: 'Back'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
