import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  int count1 = 0;
  void incrementCounter1()
  {
    setState(() {
      count1++;
    });
  }
  void decrementCounter1()
  {
    setState(() {
      count1--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: Text('Counter App',style: TextStyle(
          color: Colors.yellowAccent,
          fontWeight: FontWeight.bold,
        ),),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Counter value : ',style: TextStyle(color: Colors.yellowAccent,fontSize: 25),),
            SizedBox(height: 10),
            Text('$count1', style: TextStyle(color: Colors.yellowAccent,fontSize: 34),),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: incrementCounter1, child: Icon(Icons.add, color : Colors.yellowAccent),),
                SizedBox(width: 20),
                ElevatedButton(onPressed: decrementCounter1, child: Icon(Icons.remove,color: Colors.yellowAccent,),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
