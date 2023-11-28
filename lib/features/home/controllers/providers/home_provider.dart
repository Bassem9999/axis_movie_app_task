import 'dart:convert';

import 'package:axis_movie_app_task/features/home/controllers/models/peoples_model.dart';
import 'package:axis_movie_app_task/features/home/controllers/repositories/home_repo.dart';
import 'package:axis_movie_app_task/core/utils/functions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier{
  HomeRepo homeRepo = HomeRepo();

 var peoplesResponse;
 List<PeopleModel> peoplesList = [];
  getPeoples(BuildContext context)async{
    peoplesList.clear();
    peoplesResponse = null;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        peoplesResponse = preferences.getString('peoples');
        List cachedList = jsonDecode(peoplesResponse!);
        for(var item in cachedList){
          peoplesList.add(PeopleModel.fromJson(item));
        }
        print("Offline");
        snackbar(context, "You are Currently offline", Colors.red);
      }

      else{
        peoplesResponse = await homeRepo.getpeoplesResponse();
        for(var item in peoplesResponse['results']){
          peoplesList.add(PeopleModel.fromJson(item));
        }
        if(peoplesList.isNotEmpty){
          List items =  peoplesList.map((e) => e.toJson()).toList();
          await preferences.setString('peoples', jsonEncode(items));
        }
        snackbar(context, "You are Currently Online", Colors.green);
      }
     
      print("###############${preferences.getString('peoples')}#############");
     // print(peoplesResponse);
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }


}