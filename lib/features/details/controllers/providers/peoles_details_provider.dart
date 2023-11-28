import 'package:axis_movie_app_task/features/details/controllers/models/peoples_details_model.dart';
import 'package:axis_movie_app_task/features/details/controllers/models/peoples_images_model.dart';
import 'package:axis_movie_app_task/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../repositories/peoles_details_repo.dart';

class PeoplesDetailsProvider with ChangeNotifier{
  PeoplesDetailsRepo peoplesDetailsRepo = PeoplesDetailsRepo();

 var peoplesDetailsResponse;
 PeopleDetailsModel? peopleDetailsModel;
  getPeoplesDetails(int id)async{
    peopleDetailsModel = peoplesDetailsResponse = null;
    notifyListeners();
    try{
      peoplesDetailsResponse = await peoplesDetailsRepo.getpeoplesDetailsResponse(id);
        peopleDetailsModel = PeopleDetailsModel.fromJson(peoplesDetailsResponse);
      
      print(peoplesDetailsResponse);
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }


 var peoplesImagesResponse;
 List<PeopleImagesModel> peoplesImagesList = [];
  getPeoplesImages(int id)async{
    peoplesImagesList.clear();
    try{
      peoplesImagesResponse = await peoplesDetailsRepo.getpeoplesImagesResponse(id);
      for(var item in peoplesImagesResponse['profiles']){
        peoplesImagesList.add(PeopleImagesModel.fromJson(item));
      }
      print(peoplesImagesResponse);
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }

  bool downloadImageLoading = false;

  downloadImage(BuildContext context,String path)async{
    downloadImageLoading = true;
    notifyListeners(); 
    try{
       await GallerySaver.saveImage(path,albumName: "Movie App");
       downloadImageLoading = false;
       notifyListeners(); 
       snackbar(context, "Downloaded Successfully", Colors.green);
    }
    catch(e){
      downloadImageLoading = false;
      notifyListeners(); 
      print(e);
    }
  }
}