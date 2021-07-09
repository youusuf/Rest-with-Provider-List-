import 'package:flutter/cupertino.dart';
import 'package:list_prov_rest/models/api_model.dart';

class Data extends ChangeNotifier{
  bool isLoading = true;
  List<Welcome> welcomeList = [];
  setIsLoading(bool value){
    isLoading = value;
    notifyListeners();
  }

  setWelcomeList(List<Welcome> list){
    welcomeList = list;
    notifyListeners();
  }

  margeWelcomeList(List<Welcome> well){
    welcomeList.addAll(well);
    notifyListeners();
  }
  Welcome getWelcomeIndex(int index){
    return welcomeList[index];
  }







}

