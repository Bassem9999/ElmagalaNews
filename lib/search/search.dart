import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';

import '../cubit/cubit.dart';
import '../webview/webview.dart';

class SearchScreen extends StatelessWidget {

  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
     var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:((context, state) {}) ,
      builder: ((context, state) {
        return  Scaffold(
        appBar: AppBar(),
         body:ListView(
           children: [

           Padding(
             padding: const EdgeInsets.all(7.0),
             child: TextFormField(
              controller: search,             
              validator: (value){
                if(value!.isEmpty){
                  return 'This Field is needed';
                }
              },
              
               onFieldSubmitted: (String value){
                cubit.searches = [];
                cubit.getsearch(value);
              },
              
             decoration: InputDecoration(
              labelText: cubit.langaugemode==1? "ابحث عما تريد" : "Search for what do you want",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              )
             ),
             ),
           ),
                      
    
            Container(
              height: 570,
           // search.text.isNotEmpty?
              child:cubit.searches.isNotEmpty?Scrollbar(
                isAlwaysShown: false,
                showTrackOnHover: true,
                interactive: true,
                thickness: 5,
                child: ListView.builder(itemCount: cubit.searches.length, itemBuilder: (context,i){
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
                child: cubit.searches[i]['urlToImage']!=null?
                 Image(image:  NetworkImage("${cubit.searches[i]['urlToImage']}",),fit: BoxFit.cover,) :
                 const Image(image: AssetImage('images/noimage1.jpg'),fit: BoxFit.cover)
                 ),
                const SizedBox(width: 10,),
                Container(
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              
                  SizedBox(height: 5,),
              
                  Text("${cubit.searches[i]['title']}",
                  textAlign: TextAlign.right,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  ),
              
                  SizedBox(height: 5,),
                  
                  cubit.searches[i]['author']!=null?
                  Text("${cubit.searches[i]['author']}",
                  style: TextStyle(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  ):Text(""),
              
                  SizedBox(height: 10,),
              
                  Text("${cubit.searches[i]['publishedAt']}",
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
                      return WebViewScreen(url: cubit.searches[i]['url'],);}));
                  },
                        ),
                      );
                    }),
              ):Center(child: CircularProgressIndicator(),)       
              //  }: Center(child: Text("Search for what you want"),
                )
            
            ]
         )   
        );
      }) ,
       );
    
  }
}