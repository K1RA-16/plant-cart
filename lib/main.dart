import 'package:flutter/material.dart';
import 'package:plant_cart/utils/themes.dart';
import 'package:plant_cart/view_models/descriptionViewModel.dart';
import 'package:plant_cart/view_models/homeViewModel.dart';
import 'package:plant_cart/views/SplashScreen.dart';
import 'package:plant_cart/views/descriptionView.dart';
import 'package:plant_cart/views/homeView.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => DescriptionViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: MyThemes.lightTheme(context),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashScreen(),
          "/home": (context) => HomeView(),
        },
      ),
    );
  }
}
