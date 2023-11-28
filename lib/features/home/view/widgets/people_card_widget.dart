import 'package:axis_movie_app_task/core/constants/end_points.dart';
import 'package:axis_movie_app_task/features/details/view/screens/peoples_details_screen.dart';
import 'package:axis_movie_app_task/features/home/controllers/providers/home_provider.dart';
import 'package:axis_movie_app_task/core/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class PeopleCardWidget extends StatelessWidget {
  int index;
  PeopleCardWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<HomeProvider>(context,listen: false);
    return InkWell(
      onTap: () {
        myPushNavigator(context, PeoplesDetailsScreen(id: value.peoplesList[index].id!.toInt()));
      },
      child: Card(
        margin: const EdgeInsets.all(5),
       // color: Colors.grey,
        child: Row(children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage("${EndPoints.imageBasePath}${value.peoplesList[index].profilePath}"))
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(value.peoplesList[index].name??"Unavailable",style: const TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text(value.peoplesList[index].gender == 2 ?"Male" : "Female",style: const TextStyle(color: Colors.grey,fontSize:13,fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Row(
              children: [
               // const Icon(Icons.pets,color: Colors.orange,),
                const SizedBox(width: 5,),
                Text(value.peoplesList[index].knownForDepartment??"Unavailable",style: const TextStyle(color: Colors.orange,fontSize:15,fontWeight: FontWeight.bold),),
              ],
            ),
            
          ],)
        ],)
      ),
    );
 
  }
}