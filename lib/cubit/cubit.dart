import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/screens/categories.dart';
import 'package:newsapp/screens/home.dart';
import 'dart:convert';
import '../screens/settings.dart';
import '../screens/worldnews.dart';
import 'states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsCubit extends Cubit<NewsStates>{

  NewsCubit():super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  bool lightmode = false;
  int langaugemode=1;

 List screens =[const HomePage(category: 'general',h_country: 'eg',),const Categories(),const WorldNews(),const Settings()];
 List titles =["Latest News","Categories","World News","Settings"];
 List arabictitles =["اخر الاخبار","التصنيفات","الاخبار العالمية","الاعدادات"];

 changebottombar(index){
    currentindex = index;
    emit(ChangeBottomNavState());
  }

  changelightmode(value){
    lightmode = value;
    emit(ChangeLightModeState());
  }

  changelanguagemode(value){
    langaugemode = value;
    print(langaugemode);
    emit(ChangeLightModeState());
  }
  
 
  List articles = [];

  List searches = [];
  
  Future getdata(String cat,String country)async{
 // emit(GetdataLoadingState());
  var url = 'https://newsapi.org/v2/top-headlines?country=$country&category=$cat&apiKey=65f7f556ec76449fa7dc7c0069f040ca';
  var response = await http.get(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  emit(GetdataSuccessState());
  articles = responsebody['articles'];
  print(responsebody);
  return responsebody;
 
}



Future getsearch(String keyword)async{
 // emit(GetdataLoadingState());
  var url = 'https://newsapi.org/v2/everything?q=$keyword&apiKey=65f7f556ec76449fa7dc7c0069f040ca';
  var response = await http.get(Uri.parse(url));
  var responsebody = jsonDecode(response.body); 
  searches = responsebody['articles'];
  emit(GetSearchdataState());
  print(responsebody);
  return responsebody;
 
}


}

//'https://newsapi.org/v2/everything?q=tesla&from=2022-10-01&sortBy=publishedAt&apiKey=65f7f556ec76449fa7dc7c0069f040ca'
//'https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca'
// key : 65f7f556ec76449fa7dc7c0069f040ca
//api key : 4ba50cbce4a84c26a3fc8e288a56c0a9

//'https://student.valuxapps.com/api/home'
//'https://newsapi.org/v2/top-headlines'