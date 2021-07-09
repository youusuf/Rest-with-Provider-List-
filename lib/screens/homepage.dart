import 'package:flutter/material.dart';
import 'package:list_prov_rest/models/api_model.dart';
import 'package:list_prov_rest/providers/data.dart';
import 'package:provider/provider.dart';
import 'package:list_prov_rest/services/api_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getData()async{
    var provider = Provider.of<Data>(context,listen: false);
    var response =await APIManager().getData();
    provider.setWelcomeList(response);
    provider.setIsLoading(false);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Integration"),
      ),
      body: Consumer<Data>(
        builder:(context,data,child){
          return data.isLoading?
          Center(
            child: SpinKitDoubleBounce(
              color: Colors.purple,
              size: 50.0,
            ),
          ): ListView.builder(
            itemCount: data.welcomeList.length,
            itemBuilder:(_,index){
              Welcome welcome = data.getWelcomeIndex(index);
              return ListTile(
                title: Text(welcome.title),
                subtitle:Text(welcome.body,
                  maxLines: 2,
                overflow: TextOverflow.ellipsis,
                ),
              );

            },
          );
        },
        
      ),
    );
  }
}
