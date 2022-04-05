import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:taniku/view/register.dart';

import 'login1.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset("assets/toba_outdoor.jpg", width: 90, height: 90,),
                const SizedBox(height: 12,),
                const Text("Toba Outdoor",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                const SizedBox(height: 12,),
                const Text("Enjoy your journey",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 90,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(200, 40),
                    maximumSize: const Size(200, 40),
                  ),
                  child: Text("Log in"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login1()));
                  },
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: const Size(200, 40),
                    maximumSize: const Size(200, 40),
                  ),
                  child: Text(
                    "Register", style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                  },

                ),
                const SizedBox(height: 50),
                TextButton(
                  child: Text(
                    "skip for now",
                    style: TextStyle(fontSize: 14),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login1()));
                  },
                ),
          ],
          ),
        ),
      ),
    );
  }
}

