// TODO Implement this library.
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:astroscope/details/DetailsPage.dart';
import 'package:astroscope/models/apod_model.dart';

class NasaCard extends StatelessWidget {
  final Apod nasa;

  const NasaCard({Key? key, required this.nasa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16.0,
      margin: EdgeInsets.all(12.0),
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 400,
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              ),
              Hero(
  tag: nasa.date,
  child: Material(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(12.0),
    clipBehavior: Clip.antiAlias,
    child: Ink.image(
      image: CachedNetworkImageProvider(nasa.url),
      height: 300,
      width: 400,
      fit: BoxFit.cover,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(nasa: nasa),
            ),
          );
        },
      ),
    ),
  ),
),

            ],
          ),
          Text(
            nasa.title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

