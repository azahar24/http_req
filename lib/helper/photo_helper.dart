import 'package:flutter_application_2/model/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoHelper{
  Future<List<Photo>?> getPost() async {
    var respose= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if(respose.statusCode==200){
      var json= respose.body;
     return photoFromJson(json);
    }
   

  }
}