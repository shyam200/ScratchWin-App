import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//TODO:import Image
AssetImage circle=AssetImage('images/circle.png');
AssetImage lucky=AssetImage('images/rupee.png');
AssetImage unlucky=AssetImage('images/sadFace.png');

//TODO: Get an array

List<String>item;
int luckyNumber;
int count=0;
String message="You Have Only Five Chances";

//TODO:init array with 25 elements

@override
  void initState() {
    super.initState();
    item=List<String>.generate(25, (index) => 'Empty');
    getRandomNumber();
  }

getRandomNumber(){
  int random=Random().nextInt(25);
  
  //set because to set the value of luckyNumber
  setState(() {
    luckyNumber=random;
  });
   
}
//TODO:Get Image method

AssetImage getImage(int index){
    String currentIndex=item[index];

    switch (currentIndex) {
      case "lucky":
          return lucky;
        break;
      case "unlucky":
          return unlucky;
        break;   
    }
        return circle;     //otherwise return circle
}

//Delay time function
delay(){
  Future.delayed(Duration(seconds: 2),(){
    reset();
  });
}

//TODO:Play Game Method

playGame(int index){
//to rebuilt state after 5 steps
       count++;
     if(count>=5)
     setState(() {
      message="Game Over!";
       this.delay();
     });
//to check index of array item with random nuber
  if (index==this.luckyNumber) {
    setState(() {
        item[index]="lucky"; 
    });
     
  if(index==this.luckyNumber){
        setState(() {
        this.message="You Won!";
        this.delay();
        });
     }
  } 
  else {  
    setState(() {
        item[index]="unlucky";      
    });
  }
}
//TODO: SnowWall Method

showAll(){
  setState(() {
    item=List<String>.filled(25, "unlucky");
    item[luckyNumber]="lucky";
  });
}

//TODO reset method

reset(){
  setState(() {
    item=List<String>.filled(25, "Empty");
    count=0;
    this.message="You Have Only Five Chances";
  });
   getRandomNumber();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Scratch And Wrin' ,style: TextStyle(color:Colors.white)),
          backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:5,
                childAspectRatio: 1.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                 ), 
               itemCount: this.item.length,
               itemBuilder: (context, i)=> SizedBox(
                height: 25.0,
                width: 25.0,
                child: RaisedButton(
                   elevation: 10.0,
                   onPressed: (){
                     this.playGame(i);
                   },
                  child: Image(
                    image: this.getImage(i),
                  ),
                 ),
               ),
               ),
             ),
             Padding(padding: EdgeInsets.all(20.0)),
             //printing the message
              Center(
                child: Text(this.message, style:TextStyle(
                      color:Colors.black,
                      fontSize:20,
                      backgroundColor: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),),
              ) ,
             Container(
               margin:EdgeInsets.all(5.0),
               child: RaisedButton(
                  color: Colors.purpleAccent,
                  child: Text('ShowAll', style: TextStyle(
                    color:Colors.white,
                    fontSize:15,
                  ),
                ), 
                onPressed: this.showAll,
                elevation: 10.0,
             ),
          ),

           Container(
               margin:EdgeInsets.all(5.0),
               child: RaisedButton(
                 elevation: 5.0,
                  color: Colors.purpleAccent,
                  child: Text('Reset', style: TextStyle(
                    color:Colors.white,
                    fontSize:15,
                  ),
                ), 
                onPressed: this.reset,
             ),
          ),
        ],
      ) ,
    );
  }
}