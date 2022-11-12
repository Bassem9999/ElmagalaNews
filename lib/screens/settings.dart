import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Settings extends StatelessWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: ((context, state) {}),
        builder: (context,state){
          var cubit = NewsCubit.get(context);
    return  Container(
      child: Column(
        children: [
          Row(
            children: [
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(cubit.langaugemode==2? "Dark Mode" : "الوضع الليلى",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSwitch(
                  value: cubit.lightmode,
                  onChanged:(value){
                  cubit.changelightmode(value);
                },
                
                ),
              )
            ],
          ),

          Row(children: [
                Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(cubit.langaugemode==2?"Languge" : "اللغة",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),

               const Spacer(),

               Column(
                children: [
                  Row(
          children: [
           
             Text(cubit.langaugemode==2?"Arabic ": "    العربية" ,style: TextStyle( fontSize: 16,fontWeight: FontWeight.bold),),

            Radio(value: 1, groupValue: cubit.langaugemode, onChanged: (value){
              cubit.changelanguagemode(value);
            },
           activeColor: Colors.blue,
            ),
          ],
        ),

         Row(
          children: [
        
             Text(cubit.langaugemode==2?"English":"الانجليزية",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

            Radio(value: 2, groupValue: cubit.langaugemode, onChanged: (value){
              cubit.changelanguagemode(value);
            }),
          ],
        ),
                ],
               )

             

          ],),

        
        ],
      ),
    );
  });
  }
}