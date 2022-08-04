import 'package:flutter/material.dart';

class DetailsScrren extends StatelessWidget {


  String title;
  String img;
  DetailsScrren({required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),),
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(img))
              ),
              // color: Colors.amber,
            ),

          ],
        ),
      ),
    );
  }
}
