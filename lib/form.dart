// Define a custom Form widget.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj/data/urls.dart';
import 'package:proj/routes.dart';
import 'package:proj/topSecretAPIKey.dart';
import 'dart:convert';
import 'SumData.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}
final unameRE = RegExp(r"^[0-9\\p{L} _\\.]+$");
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
String _selectedRegion;
// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
final formTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    formTextController.dispose();
    super.dispose();
  }




  final _formKey = GlobalKey<FormState>();
  onChangeDropdownItem(String selectedRegion) {
    setState(() {
      _selectedRegion= selectedRegion;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: formTextController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              if (unameRE.hasMatch(value)){
                return 'Invalid username';
              }
              return null;
            },
          ),
          Text('Select a Region'),
          DropdownButton<String>(
            value: _selectedRegion,
                items: <String>['NA', 'OCE', 'EUNE', 'KR','EUW','JPN','LAS','BR','RU','TUR'].map((String value) {
                  return  DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChangeDropdownItem,
              ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  List<String> navArg = [formTextController.text,_selectedRegion];
                  // If the form is valid, display a Snackbar.
                  Navigator.pushNamed(context, sumRoute,
                                      arguments:
                                         navArg,);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}