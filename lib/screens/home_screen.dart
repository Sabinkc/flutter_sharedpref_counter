import 'package:counter_sharedpref/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sharedPrefInstance = SharedPreference();

  @override
  void initState() {
    // (This code may load 0 value at first then update to sharedpref value because await function stops the execution of the same function only but setstate could still be called without its execution as it doesnot lies in the same future function )
    // sharedPrefInstance.getCounterValue();
    // setState(() {

    // });
    loadCounterValue();
    super.initState();
  }

  Future loadCounterValue() async {
    await sharedPrefInstance.getCounterValue();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Subract button pressed"),
                duration: Duration(milliseconds: 3000),
                backgroundColor: Colors.red,
              ));
              setState(() {
                sharedPrefInstance.counterValue--;
                sharedPrefInstance.saveCounterValue();
              });
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 40,
            )),
      ),
      body: Center(
          child: Text(
        "${sharedPrefInstance.counterValue}",
        style: TextStyle(fontSize: 50),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.fixed,
              duration: Duration(milliseconds: 3000),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(),
              content: Container(child: Text("Add button Pressed"))));

          setState(() {
            sharedPrefInstance.counterValue++;
            sharedPrefInstance.saveCounterValue();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
