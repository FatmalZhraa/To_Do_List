import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:to_do_list/views/home_view.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: HomeView(),
      duration: 3000,
      imageSize: 140,
      backgroundColor: Colors.black,
      imageSrc: "images/splashimg.jpg",
    );
    return MaterialApp(
      title: 'Splash screen Demo',
      home: example1,
    );
  }
}