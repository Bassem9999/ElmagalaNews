import 'package:flutter/material.dart';
import 'package:newsapp/screens/home.dart';

class WorldNews extends StatelessWidget {
  const WorldNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage(category: 'general',h_country: 'us',);

  }
}