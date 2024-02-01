import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_page/HomePage/HomeScreen.dart';
import 'package:login_page/Reg&Log_Page/login_page.dart';
import 'package:login_page/firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.purpleAccent,
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("assets/images/hotel.jpg"),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen:FirebaseAuth.instance.currentUser!=null? const HomeScreen() : LoginPage(),
      ),
    );
  }
}



