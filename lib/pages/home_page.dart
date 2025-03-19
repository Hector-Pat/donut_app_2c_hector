import 'package:donut_app_2c_hector/tabs/burger_tab.dart';
import 'package:donut_app_2c_hector/tabs/donut_tab.dart';
import 'package:donut_app_2c_hector/tabs/pancakes_tab.dart';
import 'package:donut_app_2c_hector/tabs/pizza_tab.dart';
import 'package:donut_app_2c_hector/tabs/smoothie_tab.dart';
import 'package:donut_app_2c_hector/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    const MyTab(iconPath: 'lib/icons/burger.png'),
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    const MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          leading: Icon(Icons.menu,
          color:Colors.grey[800]
          ),
          actions:[
            Padding(
              padding: const EdgeInsets.only(right:24.0),
              child: Icon(Icons.person),
            )
          ]
        ),
        body: Column(
          children: [
            //Texto principal
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text("I want to ",
                  style: TextStyle(fontSize:32),),
                      
                  Text("Eat",
                  style: TextStyle(
                    //tamaño de letra
                    fontSize:32,
                    //negritas
                    fontWeight: FontWeight.bold,
                    //subrayado
                    decoration: TextDecoration.underline))
                    
                  
                ],
              ),
            ),
            
            // pestañas/tapbar
            TabBar(tabs: myTabs),
            // contenido/tapbarview
            Expanded(
              child: TabBarView(children: [
                DonutTab(),
                BurgerTab(),
                PancakesTab(),
                PizzaTab(),
                SmoothieTab(),
              ]),
            ),
            //Carrito/cart
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Row(
                //esto alinea los elementos a los extremos
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Column(
                  //alinear horizontalmente una comulmna
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2 Items | \$45",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("delivery charges included"),
                    
                  ],
                ), ElevatedButton(
                  onPressed:() {},
                  style :ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(
                      horizontal:24, vertical: 12
                    )
                  ) ,
                child:const Row(
                  children: [
                    Icon(Icons.shopping_cart,
                    color: Colors.white,
                    ),
                    SizedBox(width: 10,),
                    Text("view cart",
                    style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )),
                  ],
                ))]
              

          
              )
            )
          ],)
      ),
    );
  }
}