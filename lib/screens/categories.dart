import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screens/home.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Categories extends StatelessWidget {
  const Categories({ Key? key }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: ((context, state) {}),
        builder: (context,state){
          var cubit = NewsCubit.get(context);

          
  card(String image,String text,String category){
  return  Padding(
    padding: const EdgeInsets.all(3.0),
    child: InkWell(
          child: Card(
            child: Column(
              children: [
               Container(
               height: 180,
               width: 400,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(image,),fit: BoxFit.cover)
               ),
               // child: Image.asset('images/business.jpg',fit: BoxFit.cover,)
               ),

               Container(
                padding: EdgeInsets.all(10),
                child: Text(text,style: TextStyle(fontSize: 20,fontWeight:  FontWeight.bold),),
               )
              ],
            ),
          ),
          onTap: (){
            cubit.articles = [];
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesNews(h_category: category,title: text,)));
          },
      ),
 
  );
}



    return  ListView(
          children: [
              card('images/business.jpg',cubit.langaugemode ==2? 'Business':'الاقتصاد والاعمال','business'),
              card('images/sports1.jpg',cubit.langaugemode==2? 'Sports':'الرياضة','sport'),
              card('images/entertainment2.jpg',cubit.langaugemode==2? 'Entertainment':'اخبار الفن','entertainment'),
              card('images/tech1.jpg',cubit.langaugemode==2? 'Technologies':'التكنولوجيا','technology'),
              card('images/scince1.jpg',cubit.langaugemode==2? 'Science':'العلوم','science'),
              card('images/health1.jpg',cubit.langaugemode==2? 'Health':'الصحة','health')
          ],
         );

           });
 
  }
}




class CategoriesNews extends StatelessWidget {
  final title;
  final h_category;
  const CategoriesNews({this.h_category,this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        centerTitle: true,
        
      ),
      body: HomePage(category: h_category,h_country: 'eg',),
    );
  }
}