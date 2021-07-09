//https://jsonplaceholder.typicode.com/posts
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:list_prov_rest/models/api_model.dart';

class APIManager{

  Future<List<Welcome>> getData()async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    var body = json.decode(response.body);
    List<Welcome> welcomeList = [];
    for(var e in body){
      Welcome welcome =  Welcome.fromJson(e);
      welcomeList.add(welcome);
    }
    return welcomeList;

  }




}