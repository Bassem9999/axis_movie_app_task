import 'package:axis_movie_app_task/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/providers/peoles_details_provider.dart';


// ignore: must_be_immutable
class PeoplesImageScreen extends StatefulWidget {
  int index;
  PeoplesImageScreen({required this.index, super.key});

  @override
  State<PeoplesImageScreen> createState() => _PeoplesImageScreenState();
}

class _PeoplesImageScreenState extends State<PeoplesImageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<PeoplesDetailsProvider>(
        builder: (context, value, child) => 
        value.peoplesDetailsResponse != null?
        Column(
          children: [
            Container(
              height: deviceHeight(context) * 0.5,
              width: deviceWidth(context),
              decoration: BoxDecoration(
               // color: Colors.red,
                image: DecorationImage(image: NetworkImage("https://www.themoviedb.org/t/p/w235_and_h235_face${value.peoplesImagesList[widget.index].filePath}"),fit: BoxFit.cover)
              ),
            ),

            const SizedBox(height: 20,),

           InkWell(
            onTap: () {
              value.downloadImage(context, "https://www.themoviedb.org/t/p/w235_and_h235_face${value.peoplesImagesList[widget.index].filePath}");
            },
             child: Container(
              height: 60,
              width: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(40)
              ),
              child: value.downloadImageLoading?
              const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 5,),)
              : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Download Image",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Icon(Icons.download,color: Colors.white,)
                ],
              ),
             ),
           )
          ],
        )
         : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}