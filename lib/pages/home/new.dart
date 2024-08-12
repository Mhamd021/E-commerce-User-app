import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/utili/colors.dart';

import '../../utili/dimensions.dart';
import 'main_page.dart';

class firsPage extends StatefulWidget {
  const firsPage({ Key? key }) : super(key: key);

  @override
  State<firsPage> createState() => _firsPageState();
}

class _firsPageState extends State<firsPage> {

final List<String> _listItem = [
   "assets/image/fast2.webp",
   "assets/image/fast4.png",
   "assets/image/abc.webp",
   "assets/image/xxx.jpg",
   
];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: AppColors.mainColor,
      appBar: AppBar
      (
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        title: Text("Home"),
        actions:<Widget> [
          Padding
          (
            padding: EdgeInsets.all(10.0),
            child: Container(
              
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text("0")),
            ),
          )
        ],
      ),
      body: SafeArea
      (
        child: Container
        (
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
                children:<Widget> 
              [
                Container(

                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: DecorationImage(
                      image: AssetImage("assets/image/Delivery-Bike-Hero-1.jpg"),
                      fit: BoxFit.cover,

                      
                       )
                  ) ,
                  child:Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          AppColors.yellowColor,
                          Colors.black.withOpacity(.2),

                        ])
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>
                      [
                        Text("Welcome ",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold), ),
                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            
                          ),
                          child: Center(child: Text("Shop Now", style: TextStyle(color: Colors.grey[900],fontWeight:FontWeight.bold ),
                          )
                          ),
                        ),
                          SizedBox(height: 15,),
                          
                      ],
                    ) ,
                  ),
                ),
                 SizedBox(height: 20,),

                Expanded(
                  child:GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children:  _listItem.map((item) => Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: InkWell(
                                 onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
            },
                                child: Container(
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                      image:  DecorationImage(
                                        image: AssetImage(item),
                                        fit: BoxFit.cover
                                      )
                                    )
                           
                                ),
                              ),

                            ) ).toList() ,
                            )
                 )
              ],
            ),
          ) ,
        )
      ) ,
    );
  }
}