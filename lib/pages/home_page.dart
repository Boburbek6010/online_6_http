import 'package:flutter/material.dart';
import 'package:online_6_http/models/data_model.dart';
import 'package:online_6_http/models/employee_model.dart';
import 'package:online_6_http/services/network_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String date = "";

  void _apiPostList(){
    NetworkService.GET(NetworkService.API_LIST, NetworkService.emptyParams()).then((response) => {
      print(response),
      _showResponse(response!)
    });
  }

  void _apiCreatePost(Data data){
    NetworkService.POST(NetworkService.API_CREATE, NetworkService.createParams(data)).then((response) => {
      _showResponse(response!)
    });
  }

  void _apiUpdatePost(Data data){
    NetworkService.PUT(NetworkService.API_UPDATE+data.id.toString(), NetworkService.updateParams(data)).then((response) => {
      _showResponse(response!)
    });
  }

  void _apiDeletePost(Data data){
    NetworkService.DELETE(NetworkService.API_DELETE+data.id.toString(), NetworkService.emptyParams()).then((response) => {
      _showResponse(response!)
    });
  }

  void _showResponse(String response){
    setState((){
      date = response;
    });
  }


  @override
  void initState(){
    super.initState();
    var date = Data(1, "Me", 100000, 21, "profileImage");
    _apiDeletePost(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(date),
      ),
    );
  }
}
