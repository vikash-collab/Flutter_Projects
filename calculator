import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_app/ui_helper/util.dart';
import 'package:my_first_app/widgets/rounded_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main(){
  runApp (MyApp());
}

class MyApp extends StatelessWidget{
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'FlutterApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize:11, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState(){   // => _myHomePageState(); // when single line return statement
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>{
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();

  var result = "";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('calculator', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller:no1Controller,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: no2Controller,
                ),
                Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed:(){
                        var no1 = int.parse(no1Controller.text.toString());
                        var no2 = int.parse(no2Controller.text.toString());
                        var sum = no1 + no2;

                        result = "The Sum of $no1 and $no2 is $sum";
                        setState((){});
                      }, child: Text('Add')),
                      ElevatedButton(onPressed:(){
                        var no1 = int.parse(no1Controller.text.toString());
                        var no2 = int.parse(no2Controller.text);
                        var Sub = no1-no2;

                        result = "The Difference between $no1 and $no2 is $Sub";
                        setState((){});
                      }, child: Text('Sub')),
                      ElevatedButton(onPressed:(){
                        var no1 = int.parse(no1Controller.text);
                        var no2 = int.parse(no2Controller.text.toString());
                        var Mul = no1*no2;

                        result = "The Multiplication of $no1 and $no2 is $Mul";
                        setState((){});

                      }, child: Text('Mul')),
                      ElevatedButton(onPressed:(){
                         var no1 = int.parse(no1Controller.text.toString());
                         var no2 = int.parse(no2Controller.text.toString());
                         var Divi = no2/no1;

                         result = "The Division of $no1 and $no2 is $Divi";
                         setState((){});
                      }, child:Text('Div')),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(21),
                  child: Text(result, style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                      textAlign: TextAlign.center),
                ),
              ]
            ),
          ),
        ),

      ),
    );
  }
}



