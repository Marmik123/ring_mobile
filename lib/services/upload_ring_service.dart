import 'package:diamrings/controller/upload_ring_controller.dart';
import 'package:dio/dio.dart';


void makePostRequest( {required Map<String,dynamic> body,required imageFile}) async {
  // Create a Dio instance
  Dio dio = Dio();
  UploadRingController ringCtrl = UploadRingController();
  // Define the URL for your POST request
  String postUrl = 'http://192.168.0.113:8080/rings'; // Replace with your API endpoint
  ringCtrl.isLoading(true);
  // Define the data you want to send in the POST request

  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
    "ring":body,
  });
  try {
    // ringCtrl.isLoading(true);
    // Send the POST request
    Response response = await dio.post(
      postUrl,
      data: formData,
      options: Options(

        // You can set headers or other configurations here
        // For example, headers: {'Authorization': 'Bearer your_token_here'}
      ),
    );

    // Handle the response
    if (response.statusCode == 200) {
      ringCtrl.isLoading(false);
      // Request was successful
      print('POST request successful: ${response.data}');
    } else {
      ringCtrl.isLoading(false);
      // Request was not successful

      print('POST request failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    ringCtrl.isLoading(false);
    // Exception occurred during the request
    print('Error during POST request: $e');
  }
}
