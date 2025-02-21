import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {

  // lista de donas
    final List donutsOnSale = [

   // [ donutFlavor, donutPrice, donutColor, imageName ]

   ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],

   ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],

   ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],

   ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],

];
  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Widget para usar cuadricula
    return GridView.builder(
      //cuantos elementos hay en una cuadricula
      itemCount: donutOnSale.length,
      padding: EdgeInsets.all(12),
      //organiza como se veran los elementos
      gridDelegate: ,
      SliverGridDelegateWithFixedCrossAxisCount(
        //cuantas columnas
        crossAxisCount: 2
      )
      ItemBuilder:(context,index){
        //cada elemento individual
        return DonutTile(
          donutFlavor
        )
        donutFlavor: donutsOnSale[index][0]
      }

    )
  }
}