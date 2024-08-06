import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
    String counterKey = '';
  int counterValue = 0;

Future<void> saveCounterValue() async {

  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(counterKey, counterValue);
}

Future getCounterValue() async{
    final prefs = await SharedPreferences.getInstance();
    // As counterValue is passed in text data, it must be assigned value stored in sharedPreferences
    counterValue =  prefs.getInt(counterKey)?? 0;
}
 
}