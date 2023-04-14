// import 'dart:io';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mlkit/mlkit.dart';
//
// class EmotionDetectorPage extends StatefulWidget {
//   @override
//   _EmotionDetectorPageState createState() => _EmotionDetectorPageState();
// }
//
// class _EmotionDetectorPageState extends State<EmotionDetectorPage> {
//   File _imageFile;
//   List<VisionFace> _faces;
//
//   final FaceDetector detector = FirebaseVision.instance.faceDetector(
//     const FaceDetectorOptions(
//       enableClassification: true,
//       enableLandmarks: false,
//       enableContours: false,
//       enableTracking: false,
//     ),
//   );
//
//   Future<void> _getImageAndDetectEmotions() async {
//     final imagePicker = ImagePicker();
//     final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
//
//     setState(() {
//       _imageFile = File(pickedFile.path);
//       _faces = null;
//     });
//
//     final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(_imageFile);
//     final List<Face> faces = await FirebaseVision.instance.faceDetector().processImage(visionImage);
//
//     setState(() {
//       _faces = faces;
//     });
//   }
//
//   @override
//   void dispose() {
//     detector.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emotion Detector'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Center(
//               child: _imageFile == null
//                   ? Text('No image selected')
//                   : Image.file(_imageFile),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _getImageAndDetectEmotions,
//             child: Text('Select Image'),
//           ),
//           if (_faces != null)
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _faces.length,
//                 itemBuilder: (context, index) {
//                   final face = _faces[index];
//                   return ListTile(
//                     title: Text('Face ${index + 1}'),
//                     subtitle: Text('Emotion: ${face.emotions}'),
//                   );
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_ml_kit_face_detection/google_ml_kit_face_detection.dart';
//
// class EmotionDetectionPage extends StatefulWidget {
//   @override
//   _EmotionDetectionPageState createState() => _EmotionDetectionPageState();
// }
//
// class _EmotionDetectionPageState extends State<EmotionDetectionPage> {
//   File? _imageFile;
//   List<Face>? _faces;
//   String? _emotion;
//
//   final _picker = ImagePicker();
//
//   Future<void> _getImageAndDetectFaces() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       final image = InputImage.fromFile(File(pickedFile.path));
//       final faceDetector = GoogleMlKitFaceDetection.faceDetector();
//       final faces = await faceDetector.process(image);
//
//       setState(() {
//         _imageFile = File(pickedFile.path);
//         _faces = faces;
//         _emotion = _detectEmotion(faces);
//       });
//     }
//   }
//
//   String? _detectEmotion(List<Face>? faces) {
//     if (faces == null || faces.isEmpty) {
//       return null;
//     }
//
//     final emotions = {
//       'happy': 0,
//       'sad': 0,
//       'neutral': 0,
//       'angry': 0,
//       'surprise': 0,
//     };
//
//     for (final face in faces) {
//       final emotionsMap = face.emotions;
//       emotionsMap.forEach((key, value) {
//         if (key == FaceEmotion.happy) {
//           emotions['happy'] = emotions['happy']! + value.toInt();
//         } else if (key == FaceEmotion.sad) {
//           emotions['sad'] = emotions['sad']! + value.toInt();
//         } else if (key == FaceEmotion.neutral) {
//           emotions['neutral'] = emotions['neutral']! + value.toInt();
//         } else if (key == FaceEmotion.angry) {
//           emotions['angry'] = emotions['angry']! + value.toInt();
//         } else if (key == FaceEmotion.surprise) {
//           emotions['surprise'] = emotions['surprise']! + value.toInt();
//         }
//       });
//     }
//
//     final maxEmotion = emotions.entries.reduce((a, b) => a.value > b.value ? a : b).key;
//     return maxEmotion;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emotion Detection'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_imageFile != null)
//               Image.file(
//                 _imageFile!,
//                 height: 300,
//               ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImageAndDetectFaces,
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 16),
//             if (_emotion != null)
//               Text(
//                 'Detected emotion: $_emotion',
//                 style: TextStyle(fontSize: 24),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mlkit/mlkit.dart';
//
// class EmotionDetectionPage extends StatefulWidget {
//   @override
//   _EmotionDetectionPageState createState() => _EmotionDetectionPageState();
// }
//
// class _EmotionDetectionPageState extends State<EmotionDetectionPage> {
//   File? _imageFile;
//   List<VisionLabel>? _labels;
//   String? _emotion;
//
//   final _picker = ImagePicker();
//   final _detector = FirebaseVisionLabelDetector.instance;
//
//   Future<void> _getImageAndDetectEmotions() async {
//     final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       final image = FirebaseVisionImage.fromFile(File(pickedFile.path));
//       final labels = await _detector.detectFromImage(image);
//
//       setState(() {
//         _imageFile = File(pickedFile.path);
//         _labels = labels;
//         _emotion = _detectEmotion(labels);
//       });
//     }
//   }
//
//   String? _detectEmotion(List<VisionLabel> labels) {
//     if (labels == null || labels.isEmpty) {
//       return null;
//     }
//
//     final emotions = {
//       'happy': 0,
//       'sad': 0,
//       'neutral': 0,
//       'angry': 0,
//       'surprise': 0,
//     };
//
//     for (final label in labels) {
//       final labelString = label.label.toLowerCase();
//       if (labelString.contains('happy')) {
//         emotions['happy'] = emotions['happy']! + label.confidence.toInt();
//       } else if (labelString.contains('sad')) {
//         emotions['sad'] = emotions['sad']! + label.confidence.toInt();
//       } else if (labelString.contains('neutral')) {
//         emotions['neutral'] = emotions['neutral']! + label.confidence.toInt();
//       } else if (labelString.contains('angry')) {
//         emotions['angry'] = emotions['angry']! + label.confidence.toInt();
//       } else if (labelString.contains('surprise')) {
//         emotions['surprise'] = emotions['surprise']! + label.confidence.toInt();
//       }
//     }
//
//     final maxEmotion = emotions.entries.reduce((a, b) => a.value > b.value ? a : b).key;
//     return maxEmotion;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emotion Detection'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_imageFile != null)
//               Image.file(
//                 _imageFile!,
//                 height: 300,
//               ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImageAndDetectEmotions,
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 16),
//             if (_emotion != null)
//               Text(
//                 'Detected emotion: $_emotion',
//                 style: TextStyle(fontSize: 24),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//
// void main() => runApp(detect());
//
// class detect extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageLabeling(),
//     );
//   }
// }
//
// class ImageLabeling extends StatefulWidget {
//   @override
//   _ImageLabelingState createState() => _ImageLabelingState();
// }
//
// class _ImageLabelingState extends State<ImageLabeling> {
//   File _imageFile;
//   List<String> _labels = [];
//
//   Future<void> _getImageAndDetectLabels() async {
//     final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
//
//     setState(() {
//       _imageFile = File(pickedFile.path);
//     });
//
//     final image = FirebaseVisionImage.fromFile(_imageFile);
//     final faceDetector = FirebaseVision.instance.faceDetector();
//     final faces = await faceDetector.processImage(image);
//
//     List<String> detectedEmotions = [];
//
//     for (final face in faces) {
//       final probability = face.smilingProbability;
//       final id = face.trackingId;
//
//       if (probability != null) {
//         if (probability > 0.5) {
//           detectedEmotions.add('Happy');
//         } else {
//           detectedEmotions.add('Neutral');
//         }
//       }
//     }
//
//     setState(() {
//       _labels = detectedEmotions;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Labeling'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _imageFile == null
//                 ? Text('No image selected.')
//                 : Image.file(
//               _imageFile,
//               height: 300,
//               width: 300,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _getImageAndDetectLabels,
//               child: Text('Select Image'),
//             ),
//             SizedBox(height: 20),
//             Column(
//               children: _labels
//                   .map(
//                     (label) => Text(
//                   label,
//                   style: TextStyle(fontSize: 20),
//                 ),
//               )
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() {
  runApp(detect());
}

class detect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotion Detection',
      home: EmotionDetector(),
    );
  }
}

class EmotionDetector extends StatefulWidget {
  @override
  _EmotionDetectorState createState() => _EmotionDetectorState();
}

class _EmotionDetectorState extends State<EmotionDetector> {
  File _image;
  List _recognitions;
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {});
  }

  Future loadModel() async {
    Tflite.close();
    try {
      await Tflite.loadModel(
        model: 'assets/converted_model2.tflite',
        labels: 'assets/labels.txt',
      );
    } catch (e) {
      print('Failed to load model.');
      print(e);
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      _recognitions = null;
    });
    detectEmotion();
  }

  Future detectEmotion() async {
    if (_isDetecting) return;

    setState(() {
      _isDetecting = true;
    });

    Uint8List imageBytes = _image.readAsBytesSync();
    List<dynamic> recognitions = await Tflite.runModelOnImage(
      path: _image.path,
      numResults: 5,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _isDetecting = false;
      _recognitions = recognitions;
    });

    // Show dialog with detected emotion
    if (_recognitions != null && _recognitions.isNotEmpty) {
      String emotion = _recognitions[0]['label'];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Emotion Detected'),
            content: Text('The detected emotion is: $emotion'),
            actions: <Widget>[
              TextButton(
                child: Text('Retry'),
                onPressed: () {
                  Navigator.of(context).pop();
                  getImage();
                },
              ),
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotion Detector'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Expanded(
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            child: Text('Pick Image'),
            onPressed: getImage,
          ),
        ],
      ),
    );
  }
}
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
//
// class detect extends StatefulWidget {
//   const detect({Key key}) : super(key: key);
//
//   @override
//   State<detect> createState() => _HomeState();
// }
//
// class _HomeState extends State<detect> {
//   File image;
//   String output = '';
//
//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }
//
//
//   pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       setState(() {
//         image = File(pickedFile.path);
//       });
//       // Call the loadModel() function after setting the image file
//       await loadModel();
//       // Call the runModel() function after loading the model
//       await runModel();
//     }
//   }
//
//   runModel() async {
//     if (image != null) {
//       var predictions = await Tflite.runModelOnImage(
//           path: image.path,
//           numResults: 5,
//           threshold: 0.05,
//           imageMean: 127.5,
//           imageStd: 127.5);
//
//       // Create a separate variable to store the output string
//       String outputString = '';
//       for (var element in predictions) {
//         outputString +=
//         '${element['label']}: ${(element['confidence'] as double).toStringAsFixed(2)}\n';
//       }
//
//       setState(() {
//         output = outputString;
//       });
//     }
//   }
//
//   loadModel() async {
//     await Tflite.loadModel(
//         model: "assets/converted_model2.tflite", labels: "assets/labels.txt");
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Emotion Based Music Player'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.7,
//               width: MediaQuery.of(context).size.width,
//               child: image == null
//                   ? const Center(child: Text('No image selected'))
//                   : Image.file(image),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => pickImage(),
//             child: const Text('Select Image'),
//           ),
//           const SizedBox(height: 20),
//           Text(output,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
//         ],
//       ),
//     );
//   }
// }