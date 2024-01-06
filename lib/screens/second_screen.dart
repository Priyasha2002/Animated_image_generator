
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


class SecondScreen extends StatefulWidget {
  final Uint8List image;
  const SecondScreen({super.key, required this.image});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 340,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.memory(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon( // <-- Icon
                  Icons.home,
                  size: 24.0,
                ),
                label: const Text('Home'), // <-- Text
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.download,
                  size: 24.0,
                ),
                label: const Text('Download'), // <-- Text
              ),
              ElevatedButton.icon(
                onPressed: () {
                  shareImage();
                },
                icon: const Icon(
                  Icons.share,
                  size: 24.0,
                ),
                label: const Text('Share'), // <-- Text
              ),
            ],
          )
        ]),
      ),
    );
  }

  void shareImage() async {
    String imagePath = await getImagePath();

    if (imagePath.isNotEmpty) {
      Share.shareFiles([imagePath], text: 'Check out my AI-generated image!');
    } else {
      // Handle error or show a message if imagePath is empty
    }
    }

  Future<String> getImagePath() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    return "${appDocDir.path}/generated_image.png";
    }
}

