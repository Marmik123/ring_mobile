

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadRingController extends GetxController{
    TextEditingController name=TextEditingController();
    TextEditingController price=TextEditingController();
    TextEditingController style=TextEditingController();
    TextEditingController metalType=TextEditingController();

    final formKey = GlobalKey<FormState>();

    RxBool isLoading=false.obs;
    XFile? imageFile;
}