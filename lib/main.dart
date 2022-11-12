import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

import 'screens/categories.dart';
import 'screens/home.dart';

void main() {
  runApp( MyApp());
}
//C:\Program Files\Android\Android Studio2\jre\bin\keytool
//  keytool -genkey -v -keystore "C:\Program Files\Android\Android Studio2\jre\bin\keytool\upload-keystore.jks" -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
//   keytool -genkey -v -keystore "C:\Users\Bassem\upload-keystore.jks" -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload

class MyApp extends StatelessWidget {
 

  ThemeData lighttheme = ThemeData(     
          primarySwatch: Colors.teal,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black)
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor:Colors.blue,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black
          )
        );

  
  ThemeData darktheme = ThemeData(
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 24, 16, 53)
          ),
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.white) 
          ),
          cardColor: Color.fromARGB(255, 24, 16, 53),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor:Colors.blue,
            unselectedItemColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 24, 16, 53),
            
          )
        );



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: ((context, state) {}),
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        
        home:  HomeScreen(),
    
       // themeMode: cubit.lightmode? ThemeData.light() : ThemeData.dark(),
    
        theme: cubit.lightmode? darktheme : lighttheme,
    
        
      );
        }, )
      
       
    );
  }
}
