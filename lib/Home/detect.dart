import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class detect extends StatefulWidget {
  const detect({Key? key}) : super(key: key);

  @override
  State<detect> createState() => _detectState();
}

class _detectState extends State<detect> {
  File? image;
  String output = '';

  @override
  void initState() {
    super.initState();
    loadModel();
  }


  pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      // Call the loadModel() function after setting the image file
      await loadModel();
      // Call the runModel() function after loading the model
      await runModel();
    }
  }

  runModel() async {
    if (image != null) {
      var predictions = await Tflite.runModelOnImage(
          path: image!.path,
          numResults: 5,
          threshold: 0.05,
          imageMean: 127.5,
          imageStd: 127.5);

      String emotion = predictions![0]['label'];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Emotion Detected'),
            content: Text(emotion),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/converted_model2.tflite", labels: "assets/labels.txt");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emotion Based Music Player'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: image == null
                  ? const Center(child: Text('No image selected'))
                  : Image.file(image!),
            ),
          ),
          ElevatedButton(
            onPressed: () => pickImage(),
            child: const Text('Select Image'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}