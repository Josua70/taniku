import 'package:taniku/view/ListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/toba_outdoor.jpg", width: 70, height: 70,),
              const SizedBox(height: 10,),
              const Text("Toba Outdoor",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 50,),
              const Text("Silahkan Register",
                  style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12
                ),
              ),
              const SizedBox(height: 12,),
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "contoh : Josua Napitupulu",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                        width: 2.0,
                  ),

                ),
                suffixIcon: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.account_circle_rounded,
                  ),
                ),
              ),
                validator: (value){
                  if (value!.isEmpty){
                    return"Nama Lengkap tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12,),
              TextFormField(
                controller: text2Controller,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "contoh : indocyber@gmail.com",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
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
                  return"Email tidak boleh kosong";
                }
                return null;
              },
            ),
              const SizedBox(height: 12,),
              TextFormField(
                controller: text3Controller,
                  obscureText: _isObscure,
                  decoration:  InputDecoration(
                  hintText: "password",
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
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


                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
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



              const SizedBox(height: 36,),
              ElevatedButton(
                child: Text("Sign Up"),
                onPressed: (){
                setState(() {
                  if (_formKey.currentState!.validate()){
                    print("Nama Lengkap => " + textController.text);
                    print("Email => " + text2Controller.text);
                    print("Password => " + text3Controller.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
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
              const SizedBox(height: 18,),
              ElevatedButton(
                child: Text("Sudah Punya Akun"),
                onPressed: (){
                setState(() {
                  if (_formKey.currentState!.validate()){
                    print("Email => " + textController.text);
                    print("Username => " + text2Controller.text);
                    print("Password => " + text3Controller.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
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
            ],
          ),
         )
        ),
      ),
    );
  }
}
