import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/constants/end_points.dart';
class HomeRepo{

  getpeoplesResponse()async{
    var url = "${EndPoints.baseUrl}/popular?language=en-US&page=1";
    var response = await http.get(Uri.parse(url),
    headers: {
      'Authorization' : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MWVkNzM4NjM0MDY5Yzk1NzhmOTBkODViMjA5M2VkNyIsInN1YiI6IjY1NjQ4ZTdkN2RmZGE2NTkyZWU2ZjZkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0aM7lh8_nAxKwDdIU_OTBK5mSp38cbiXwGik1HC2j88",
      'Accept' : "application/json"
    }
    );
     var reponseBody = jsonDecode(response.body);
     return reponseBody;
  }
}