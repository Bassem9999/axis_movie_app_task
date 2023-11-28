import 'package:axis_movie_app_task/features/home/controllers/providers/home_provider.dart';
import 'package:axis_movie_app_task/features/home/view/widgets/people_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  void initState() {
    Provider.of<HomeProvider>(context,listen: false).getPeoples(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peoples",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) => 
        value.peoplesResponse != null?
        ListView.builder(
          itemCount: value.peoplesList.length,
          itemBuilder: (context,i){
            return PeopleCardWidget(index: i);
          }) : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}