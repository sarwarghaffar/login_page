import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/HomePage/HomeScreen.dart';
import 'package:login_page/Reg&Log_Page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
       title: Text(
         'Login Screen',
       style: TextStyle(
           color: Colors.white,
       ),
       ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Login Page',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width*0.040,
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: inputEmail,

                            decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )
                              )
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: inputPassword,
                          obscureText: true,

                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: Icon(Icons.remove_red_eye),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.black,
                              )
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width*0.90,
                    minWidth: MediaQuery.of(context).size.width*0.70,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade700,
                      elevation: 6,
                    ),
                      onPressed: (){

                      auth.createUserWithEmailAndPassword(
                          email: inputEmail.text,
                          password: inputPassword.text,
                      );

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>RegisterPage()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width*0.020,
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
