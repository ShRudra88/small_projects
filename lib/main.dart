import 'package:flutter/material.dart';

void main() {
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
  Map<String, double> formValue = {"Num1": 0, "Num2": 0, "Num3": 0};
  double sum = 0;

  void myInputOnChange(String inputKey, String inputValue) {
    setState(() {
      formValue.update(inputKey, (value) => double.tryParse(inputValue) ?? 0.0);
    });
  }

  void addAllNumbers() {
    setState(() {
      sum = formValue['Num1']! + formValue['Num2']! + formValue['Num3']!;
    });
  }

  // Function to show the AlertDialog with the sum
  Future<void> _showSumAlertDialog(double sum) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sum Result'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('The sum of the numbers is: $sum'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the AlertDialog
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: Text(
          'Sum App',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Sum : $sum',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                myInputOnChange("Num1", value);
              },
              decoration: InputDecoration(labelText: "First number"),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                myInputOnChange("Num2", value);
              },
              decoration: InputDecoration(labelText: "Second number"),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                myInputOnChange("Num3", value);
              },
              decoration: InputDecoration(labelText: "Third number"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    addAllNumbers();
                  },
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  child: Text('Show Sum'),
                  onPressed: () {
                    _showSumAlertDialog(sum);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
