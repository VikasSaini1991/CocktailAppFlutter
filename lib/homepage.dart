import 'dart:convert';

import 'package:cocktail_app_flutter/drinkdetails.dart';
import 'package:cocktail_app_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api="https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var drinks,response;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  fetchData()
  async{
    response=await http.get(api);
    drinks=jsonDecode(response.body)["drinks"];
    print(drinks);
    setState(() {

    });

  }
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Cocktail App"),

          elevation: 0.0
        ),
        body: Center(
          child: response !=null ?ListView.builder( itemCount: drinks.length,itemBuilder: (context ,index){
            var drinksItem=drinks[index];
            return  ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DrinkDetails(drinks: drinksItem)));
              },
              title: Text(drinksItem["strDrink"],style: TextStyle(color: Colors.white),),
              leading: Hero(
                  tag: drinksItem["idDrink"], child: CircleAvatar(backgroundImage:NetworkImage(drinksItem["strDrinkThumb"]?? "https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg"),)),
           subtitle: Text(drinksItem["idDrink"],style: TextStyle(color: Colors.white),),

            );


          }):CircularProgressIndicator(backgroundColor: Colors.white,),
        )
      ),
    );
  }
}
