import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screens/worldnews.dart';
import 'package:newsapp/search/search.dart';
import 'package:newsapp/webview/webview.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'categories.dart';
import 'settings.dart';
 





class HomePage extends StatelessWidget {
 final category;
 final h_country;
  const HomePage({ this.category,this.h_country});
  @override
  Widget build(BuildContext context) {
        var cubit = NewsCubit.get(context);         
          return  FutureBuilder(
            future: cubit.getdata(category,h_country),
            builder: (BuildContext context, AsyncSnapshot snapshot){

        if(cubit.articles.isNotEmpty){
          return Scrollbar(
            isAlwaysShown: false,
            showTrackOnHover: true,
            interactive: true,
            thickness: 5,
            child: ListView.builder(itemCount: cubit.articles.length, itemBuilder: (context,i){
                  return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              child: Card(
                child: Row(
                  children: [
                  Container(
            height: 120,
            width: 130,
            child: cubit.articles[i]['urlToImage']!=null?
             Image(image:  NetworkImage("${cubit.articles[i]['urlToImage']}",),fit: BoxFit.cover,) :
             const Image(image: AssetImage('images/noimage1.jpg'),fit: BoxFit.cover)
             ),
            const SizedBox(width: 10,),
            Container(
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
              SizedBox(height: 5,),
          
              Text("${cubit.articles[i]['title']}",
              textAlign: TextAlign.right,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              ),
          
              SizedBox(height: 5,),
              
              cubit.articles[i]['author']!=null?
              Text("${cubit.articles[i]['author']}",
              style: TextStyle(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              ):Text(""),
          
              SizedBox(height: 10,),
          
              Text("${cubit.articles[i]['publishedAt']}",
              style: TextStyle(color: Colors.grey),
              )
                ],
              ),
            )
                  ],
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return WebViewScreen(url: cubit.articles[i]['url'],);}));
              },
                    ),
                  );
                }),
          );
                 
               }
              
            else{
            
              return Center(child: CircularProgressIndicator(),);
            }
            });
          
      
      
      
   
 
}
  }








class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: cubit.langaugemode==2? Text(cubit.titles[cubit.currentindex]):
                                   Text(cubit.arabictitles[cubit.currentindex]),
        centerTitle: true,
        leading: Container(child: IconButton(icon:Icon(Icons.search),onPressed: (){
          cubit.searches = [];
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
        },)),
      ),

        
          bottomNavigationBar: BottomNavigationBar(
           currentIndex: cubit.currentindex,
           onTap: (value){
            cubit.articles = [];
            cubit.changebottombar(value);
           
           },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper,),
                label: cubit.langaugemode==2? "Latest News" : "اخر الاخبار"            
                ),

                 BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: cubit.langaugemode==2? "Categories" :  "التصنيفات"               
                ),

                 BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                label:  cubit.langaugemode==2? "World News" :"الاخبار العالمية"             
                ),

                BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: cubit.langaugemode==2?  "Settings" : "الاعدادات"               
                ),
            ],
          ),

          body: cubit.screens[cubit.currentindex],

    );
  }
}