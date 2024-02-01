import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login_page/HomePage/HomeScreen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController userName = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
        backgroundColor: Colors.orange,
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
                          'Register Page',
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
                            controller: userName,

                            decoration: InputDecoration(
                                hintText: 'UserName',
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: inputEmail,

                            decoration: InputDecoration(
                                hintText: 'email',
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
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () async {

                      final auth = FirebaseAuth.instance;
                      final db = FirebaseDatabase.instance.ref();

                     await auth.createUserWithEmailAndPassword(
                          email: inputEmail.text,
                          password: inputPassword.text,
                      ).then((value) {
                        db.child('user').child(auth.currentUser!.uid).set({
                          "userName": userName.text,
                          "email": inputEmail.text,
                          "password": inputPassword,
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>HomeScreen()));

                     });

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
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
