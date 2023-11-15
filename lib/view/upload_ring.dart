import 'package:diamrings/components/loader.dart';
import 'package:diamrings/controller/upload_ring_controller.dart';
import 'package:diamrings/services/upload_ring_service.dart';
import 'package:diamrings/view/ImagePickerScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RingUpdate extends StatelessWidget {


  UploadRingController ringCtrl= UploadRingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 20,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Upload Ring Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height/2,
        child: Form(
key: ringCtrl.formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
              TextFormField(
                  controller: ringCtrl.name,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ring name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ringCtrl.metalType,
                decoration: InputDecoration(
                hintText: 'Enter Metal Type',
              ),validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter ring metal type';
                }
                return null;
              },
              ),
              TextFormField(
                controller: ringCtrl.style,
                decoration: InputDecoration(
                hintText: 'Enter Style',
              ),validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter ring style';
                }
                return null;
              },),
              TextFormField(
                  controller: ringCtrl.price,
                  decoration: InputDecoration(
                hintText: 'Enter Price in ₹ ',
                prefixText: '₹',
              ),
              keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ring price';
                    }
                    return null;
                  }
              ),
                ElevatedButton(

                    onPressed: () {
                      var body =
                      {
                        "imageURL":"abbvbv",
                        "metalType":ringCtrl.metalType.text,
                        "name":ringCtrl.name.text,
                        "price":ringCtrl.price.text,
                        "style":ringCtrl.style.text
                      };
                      if (ringCtrl.formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImagePickerScreen(body:body ,)));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter all details')),
                        );
                      }

                    },
                    // style: ButtonStyle(
                    //   fixedSize: MaterialStateProperty.all(Size(120, 0))
                    // ),
                    child: const Text('Upload Image'),),

          ],
        ),
            )),
      ),
    );
  }
}
