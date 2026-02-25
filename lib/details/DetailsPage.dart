import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../models/apod_model.dart';

class DetailsPage extends StatelessWidget {
  final Apod nasa;

  const DetailsPage({
    super.key,
    required this.nasa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nasa.title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Hero(
                tag: nasa.date,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: nasa.url,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),

          // Date & Copyright
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nasa.date,
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Expanded(
                  child: Text(
                    nasa.copyright != null
                        ? "© ${nasa.copyright}"
                        : "",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              nasa.explanation,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
