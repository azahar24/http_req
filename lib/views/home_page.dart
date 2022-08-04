import 'package:flutter/material.dart';
import 'package:flutter_application_2/helper/photo_helper.dart';
import 'package:flutter_application_2/views/details.dart';

import '../model/photo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo>? photos;
  bool isLoded = false;

  getData() async {
    photos = await PhotoHelper().getPost();
    setState((){
      isLoded = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoded,
        child: ListView.builder(
            itemCount: photos?.length??0,
            itemBuilder: (_,index){
              return Card(
                child: ListTile(
                  title: Text(photos![index].title,maxLines: 2,),
                  subtitle: Text(photos![index].id.toString()),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsScrren(title: photos![index].title, img: photos![index].url)));
                  },

                  leading: Container(
                    height: 200,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(photos![index].thumbnailUrl))
                    ),
                   // color: Colors.amber,
                  ),
                  trailing: Icon(Icons.list),
                ),
              );
            }),
        replacement: Center(child: CircularProgressIndicator(),),
      ),

    );
  }
}
