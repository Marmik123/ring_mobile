import 'dart:io';

import 'package:diamrings/components/loader.dart';
import 'package:diamrings/controller/upload_ring_controller.dart';
import 'package:diamrings/services/upload_ring_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerScreen extends StatefulWidget {

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
  Map<String,dynamic>? body;

  ImagePickerScreen({required this.body});
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? image;
  UploadRingController ringController=UploadRingController();

  Future<void> pickImage(ImageSource source) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      image = pickedImage;
      print("IMAGE PATH IS : ${image?.path}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image == null
                  ? Text('No image selected.')
                  : Image.file(File(image!.path)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    child: Text('Take Picture'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    child: Text('Choose from Gallery'),
                  ),
                ],
              ),
              Obx(()=>ringController.isLoading()?buildLoader():ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                    print(widget!.body);
                    print("HELLO IMAGE PATH:${image?.path}");
                    makePostRequest(body: widget.body!,imageFile: image);
                },
                child: const Text('Submit'),
              )),

            ],
          ),
        ),
      ),
    );
  }
}
