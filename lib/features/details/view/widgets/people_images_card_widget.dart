import 'package:axis_movie_app_task/features/details/controllers/providers/peoles_details_provider.dart';
import 'package:axis_movie_app_task/features/details/view/screens/people_image_screen.dart';
import 'package:axis_movie_app_task/core/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/end_points.dart';


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
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage("${EndPoints.imageBasePath}${value.peoplesImagesList[index].filePath}"))
          ),
        ),
      );
 
  }
}