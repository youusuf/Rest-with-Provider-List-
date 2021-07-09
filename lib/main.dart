import 'package:flutter/material.dart';
import 'package:list_prov_rest/providers/data.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create:(context)=>Data(),
        child: HomePage(),
      ),
    );
  }
}

