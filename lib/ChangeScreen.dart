import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class changescreen extends StatefulWidget {
  const changescreen({Key? key, required this.text,required this.image, required this.email}) : super(key: key);
  final  String? text;
  final String? image;
  final String? email;

  @override
  State<changescreen> createState() => _changescreenState();
}

class _changescreenState extends State<changescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16,),

              Image.network("${widget.image}", height: 200, width: 200,
                  errorBuilder: (context, error, stackTrace) {
                    print(error);
                    return Container(
                      height: 70,
                      width: 70,
                      child: Icon(
                        Icons.warning_amber_outlined, color: Colors.redAccent,),
                    );
                  }
              ),
              SizedBox(height: 16,),
              Text(
                "${widget.text}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 16,),
              Text(
                "${widget.email}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
