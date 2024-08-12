import 'package:flutter/material.dart';
import 'package:sampleproject/utili/colors.dart';

class Orders extends StatelessWidget {
  const Orders({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            bottom: const TabBar(
              tabs: [
                Tab(
                  
                  icon: Icon(Icons.shopping_bag),
                  text: "History",
                  
                  ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: "Active",
                  ),
              ],
            ),
            title: const Text('orders'),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("you havd no orders")),
              
              Center(child: Text("you havd no orders")),
            ],
          ),
        ),
    );
  }
}