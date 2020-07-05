import 'package:cocktail_app_flutter/main.dart';
import 'package:flutter/material.dart';
class DrinkDetails extends StatelessWidget {
  final drinks;


  DrinkDetails({ Key key,@required this.drinks}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       gradient: LinearGradient(colors: [
         myColor,
         Colors.orange
       ])
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(drinks["strDrink"]),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            CircleAvatar(
              radius: 100,

              backgroundImage: NetworkImage(drinks["strDrinkThumb"] ??"https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg"),
            ),
            SizedBox(height: 30,),
            Text(drinks["idDrink"],style: TextStyle(color: Colors.white)),
            SizedBox(height: 30,),
            Text(drinks["strDrink"],style: TextStyle(color: Colors.white,fontSize: 20)),


            ],),
        ),

      ),
    );

  }
}
