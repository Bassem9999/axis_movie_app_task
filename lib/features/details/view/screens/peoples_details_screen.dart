import 'package:axis_movie_app_task/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/providers/peoles_details_provider.dart';
import '../widgets/people_images_card_widget.dart';


// ignore: must_be_immutable
class PeoplesDetailsScreen extends StatefulWidget {
  int id;
  PeoplesDetailsScreen({required this.id, super.key});

  @override
  State<PeoplesDetailsScreen> createState() => _PeoplesDetailsScreenState();
}

class _PeoplesDetailsScreenState extends State<PeoplesDetailsScreen> {

@override
  void initState() {
    Provider.of<PeoplesDetailsProvider>(context,listen: false).getPeoplesDetails(widget.id);
    Provider.of<PeoplesDetailsProvider>(context,listen: false).getPeoplesImages(widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<PeoplesDetailsProvider>(
        builder: (context, value, child) => 
        value.peoplesDetailsResponse != null?
        ListView(
          children: [
            Container(
              height: deviceHeight(context) * 0.4,
              width: deviceWidth(context),
              decoration: BoxDecoration(
               // color: Colors.red,
                image: DecorationImage(image: NetworkImage("https://www.themoviedb.org/t/p/w235_and_h235_face${value.peopleDetailsModel!.profilePath}"),fit: BoxFit.cover)
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              child: Text("${value.peopleDetailsModel?.name}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("${value.peopleDetailsModel?.placeOfBirth}",style: const TextStyle(fontSize: 15,color: Colors.grey),),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
              child: Text("Biography",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("${value.peopleDetailsModel?.biography}",style: const TextStyle(fontSize: 15),),
            ),

            SizedBox(
              height: value.peoplesImagesList.length == 1? value.peoplesImagesList.length * 200 : value.peoplesImagesList.length * 110,
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                  itemCount: value.peoplesImagesList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,i){
                    return PeopleImagesCardWidget(index: i,);
                  }),
              ),
            )
          ],
        )
         : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}