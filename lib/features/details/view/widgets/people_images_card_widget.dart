import 'package:axis_movie_app_task/features/details/controllers/providers/peoles_details_provider.dart';
import 'package:axis_movie_app_task/features/details/view/screens/people_image_screen.dart';
import 'package:axis_movie_app_task/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class PeopleImagesCardWidget extends StatelessWidget {
  int index;
  PeopleImagesCardWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<PeoplesDetailsProvider>(context,listen: false);
    return 
      InkWell(
        onTap: () {
          myPushNavigator(context, PeoplesImageScreen(index: index));
        },
        child: Container(
          height: 130,
          width: 130,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage("https://www.themoviedb.org/t/p/w235_and_h235_face${value.peoplesImagesList[index].filePath}"))
          ),
          //child: Image.network("https://www.themoviedb.org/t/p/w235_and_h235_face${value.peoplesList[index].profilePath}"),
        ),
      );
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //   Text(value.peoplesList[index].name??"Unavailable",style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),),
      //   SizedBox(height: 5,),
      //   Text(value.peoplesList[index].gender == 2 ?"Male" : "Female",style: TextStyle(color: Colors.grey,fontSize:13,fontWeight: FontWeight.bold),),
      //   SizedBox(height: 5,),
      //   Row(
      //     children: [
      //       Icon(Icons.pets,color: Colors.orange,),
      //       SizedBox(width: 5,),
      //       Text(value.peoplesList[index].knownForDepartment??"Unavailable",style: TextStyle(color: Colors.orange,fontSize:15,fontWeight: FontWeight.bold),),
      //     ],
      //   ),
        
      // ],)
 
  }
}