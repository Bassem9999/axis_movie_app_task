import 'package:flutter/material.dart';

myPushNavigator(context, screen) {
 // return Navigator.of(context).push(SlideRoute(page: screen));
 return Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
}

myReplaceNavigator(context, screen) {
  return Navigator.maybeOf(context)!.pushReplacement(MaterialPageRoute(builder: (context) => screen));
}

deviceHeight(BuildContext context){
return MediaQuery.of(context).size.height;
}


deviceWidth(BuildContext context){
return MediaQuery.of(context).size.width;
}

showdialog(context, String text, var content,actions, var color) {
  return showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              text,
              style: const TextStyle(color: Colors.white),
            //  textDirection: TextDirection.rtl,
            ),
            content: content,
            actions:actions ,
            backgroundColor: color,
          ),
        );
      });
}

snackbar(context, String message,Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}

 showcircle(context) {
    return showDialog(context: context, builder: (context) {
      return const AlertDialog( 
        title: Row(
          children: [
            Text(" Loading ....    ",style: TextStyle(color: Colors.white),),
            CircularProgressIndicator(),
          ],
        ),
        backgroundColor: Colors.grey,    
      );
    }
    );
    }



 
