import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'manual.dart';
import 'youtube/screens/home_screen.dart';
import 'dart:io';
// List<String> emotion = ['happiness','sadness', 'neutral', 'anger', 'surprise'];
class Detect extends StatefulWidget {
  const Detect({Key? key}) : super(key: key);

  @override
  State<Detect> createState() => _DetectState();
}

class _DetectState extends State<Detect> {
  File? _image;
  String _output = '';
  late Future<void> _modelLoaded;

  @override
  void initState() {
    super.initState();
    _modelLoaded = loadModel();
  }

  Future<void> pickImage(ImageSource camera) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // Call the runModel() function after setting the image file
      await runModel();
    }
  }

  Future<void> runModel() async {
    if (_image != null) {
      final List<dynamic>? results = await Tflite.runModelOnImage(
        path: _image!.path,
        numResults: 5,
        threshold: 0.05,
        imageMean: 127.5,
        imageStd: 127.5,
        asynch: true,
      );

      if (results != null) {
// add a null check here

        setState(() {
          _output = results[0]['label'];
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Emotion Detected',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                _output,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen2(_output),
                      ),
                    );
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    elevation: 8.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    pickImage(ImageSource.camera);
                  },
                  child: const Text(
                    'Retry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    elevation: 8.0,
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "C:\\Users\\admin\\AndroidStudioProjects\\Moodify-Flutter\\assets\\model_unquant.tflite",
      labels: "C:\\Users\\admin\\AndroidStudioProjects\\Moodify-Flutter\\assets\\labels.txt",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _modelLoaded,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: _image == null
                        ? const Center(child: Text('No image selected'))
                        : Image.file(_image!),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => pickImage(ImageSource.camera),
                  child: const Text(
                    'Select Image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    elevation: 8.0,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => manual(),
                      ),
                    );
                  },
                  child: const Text(
                    'Use Emoji',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    elevation: 8.0,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
