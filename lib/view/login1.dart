import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:taniku/view/ListScreen.dart';
import 'package:taniku/view/bottomNavigation.dart';

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  //password
  bool _isObscure = true;
  void _togglePasswordVisibility(){
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  final _formKey = GlobalKey<FormState>();
  var textController = new TextEditingController();
  var text2Controller = new TextEditingController();
  var text3Controller = new TextEditingController();
  bool checkedValue = false;
  String _selectedGender = "male";
  List<String> dropDownList = ["Senin","Selasa","Rabu","Kamis","Jumat","Sabtu"];
  var selectedDropDown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body:SingleChildScrollView(
        child: Form(
          key: _formKey,
            child: Container(
             margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/toba_outdoor.jpg", width: 70, height: 70,),
                      const SizedBox(height: 80,),
                      TextFormField(
                        controller: textController,
                        decoration: const InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,

                        ),
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                        ),
                      ),
                          suffixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                            Icons.email_outlined,
                        ),
                      ),
                    ),
                   validator: (value){
                    if (value!.isEmpty){
                    return "Email tidak boleh kosong";
                }
                return null;
                },
              ),
                 const SizedBox(height: 12,),

                TextFormField(
                    obscureText: _isObscure,
                    controller: text3Controller,
                    decoration:  InputDecoration(
                    hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                    ),
                  ),
                labelText: "Password",
                  suffixIcon: GestureDetector(
                    onTap: (){
                      _togglePasswordVisibility();
                    },
                    child: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: _isObscure ? Colors.grey : Colors.blue,
                    ),
                  ),
                // isDense: true,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                    ),
                  ),
                ),
                  validator: (value){
                  if (value!.isEmpty){
                    return"Password tidak boleh kosong";
                  }
                  return null;
                },
                 ),

                   CheckboxListTile(
                     title: Text("setuju"),
                     value: checkedValue,
                     onChanged: (newValue){
                       setState(() {
                         checkedValue = newValue!;
                         print(newValue);
                       });
                     },
                     controlAffinity: ListTileControlAffinity.leading,
               ),
               SizedBox(height: 12,),

               Text("Contoh Radio Button",
               ),

                 ListTile(
                     leading: Radio<String>(
                       value: "male",
                       groupValue: _selectedGender,
                       onChanged: (value){
                         setState((){
                           _selectedGender = value!;
                           print(value);
                         });
                       },
                     ),
                     title: const Text("male"),
                 ),
                 ListTile(
                   leading: Radio<String>(
                     value: "Female",
                     groupValue: _selectedGender,
                     onChanged: (value){
                       setState(() {
                         _selectedGender = value!;
                         print(value);
                       });
                     },
                   ),
                   title: const Text("female"),
                 ),
                 SizedBox(height: 16,),

                 Text("Contoh Drop Down"),

                 DropdownButton(
                   isExpanded: true,
                   hint: Text("Silahkan pilih hari"),
                   value: selectedDropDown,
                   onChanged: (newValue){
                     setState(() {
                       print(newValue.toString());
                       selectedDropDown = newValue;
                     });
                   },
                 items: dropDownList.map((String value){
                   return DropdownMenuItem(
                     value: value,
                     child: Text(value),
                   );
                 }).toList(),
               ),


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: const Size(200, 40),
                  maximumSize: const Size(200, 40),
                 ),
                   child: Text("Log in"),
                onPressed: (){
                setState(() {
                if (_formKey.currentState!.validate()){
                  print("Email => " + textController.text);
                  print("Username => " + text2Controller.text);
                  print("Password => " + text3Controller.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
                }else{
                  print("Email => " + textController.text);
                  print("Username => " + text2Controller.text);
                  print("Password => " + text3Controller.text);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Informasi"),
                        content: Text("Silahkan lengkapi data anda"),
                        actions: [
                          TextButton(
                            child: Text("ok"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                   );
                  }
                }
              );
             },
           ),
               const SizedBox(height: 12),
                 TextButton(
                    child: Text(
                  "Forgot Password",
                   style: TextStyle(fontSize: 13),
                   ),
                   onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
               },
                ),

                 const SizedBox(height: 12),
                 const Text("or",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12
               ),
               ),
                const SizedBox(height: 12,),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size(240, 40),
                  maximumSize: const Size(240, 40),
                ),
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
                },
                 child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network("https://tse2.mm.bing.net/th?id=OIP.ge8gsp00Sv-OD0ryuDr1hgHaHa&pid=Api&P=0&w=169&h=169", width: 40,height: 40,),
                        const SizedBox(width: 10,),
                        Text("Log in with facebook",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                )
              ),
                const SizedBox(height: 10,),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size(240, 40),
                  maximumSize: const Size(240, 40),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));

                },
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw0iAly4R-Ibcyv4I6ihcbZbcIszy0REJMMA&usqp=CAU", width: 40,height: 40,),
                        const SizedBox(width: 10,),
                        Text("Log in with google",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                )
                ),
               const SizedBox (height: 12,),
               const Text("Dont have any account",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      ),
      ),

    );
  }
}
