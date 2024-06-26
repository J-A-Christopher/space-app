import 'dart:io';

import 'package:dio/dio.dart';
import 'package:space/common/utils/constants.dart';
import 'package:space/common/utils/exceptions.dart';
import 'package:space/features/login/Data/models/login_model_response.dart';
import 'package:space/features/signup/Data/models/signup_model_response.dart';
import 'package:space/features/spaceupload/Data/model/space_model.dart';

abstract class SpaceAppRequests {
  Future<SignUpDataResponse> signUpUser(
      {required Map<String, dynamic> userData});

  Future<LoginResponse> loginUser({required Map<String, dynamic> loginData});
  Future<SpaceModel> uploadImageAndData(
      {required File imageFile,
      required String name,
      required String description,
      required List<File> spaceImages});
}

class SpaceAppRequestsImplementation implements SpaceAppRequests {
  final dio = Dio();
  @override
  //User signup
  Future<SignUpDataResponse> signUpUser(
      {required Map<String, dynamic> userData}) async {
    try {
      final requestData = await dio.post(
        '$base_url/sign-up',
        data: userData,
        options: Options(sendTimeout: const Duration(seconds: 10)),
      );
      print('cont${requestData.data}');
      if (requestData.data.containsKey('errors')) {
        final dataRetrieved =
            requestData.data['errors'] as Map<String, dynamic>;
        for (var key in dataRetrieved.keys) {
          final errors = dataRetrieved[key] as List<dynamic>;
          if (errors.isNotEmpty) {
            throw RequestException(errors[0]);
          }
        }
      }
      return SignUpDataResponse.fromJson(requestData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        final requestMessage = e.response!.data['message'];

        throw RequestException(requestMessage);
      } else {
        //When device is offline
        String? errorMessage = e.message;
        int colonIndex = errorMessage!.indexOf(':');
        String extractedPart =
            "${errorMessage.substring(0, colonIndex).trim()} are you online?";
        throw NetworkException(extractedPart);
      }
    }
  }

  @override
  Future<LoginResponse> loginUser(
      {required Map<String, dynamic> loginData}) async {
    try {
      final requestData = await dio.post(
        '$base_url/sign-in',
        data: loginData,
        options: Options(sendTimeout: const Duration(seconds: 10)),
      );
      if (requestData.data.containsKey('errors')) {
        final dataRetrieved =
            requestData.data['errors'] as Map<String, dynamic>;
        for (var key in dataRetrieved.keys) {
          final errors = dataRetrieved[key] as List<dynamic>;
          if (errors.isNotEmpty) {
            throw RequestException(errors[0]);
          }
        }
      }
      return LoginResponse.fromJson(requestData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        final requestMessage = e.response!.data['message'];

        throw RequestException(requestMessage);
      } else {
        //When device is offline
        String? errorMessage = e.message;
        int colonIndex = errorMessage!.indexOf(':');
        String extractedPart =
            "${errorMessage.substring(0, colonIndex).trim()} are you online?";
        throw NetworkException(extractedPart);
      }
    }
  }

  @override
  Future<SpaceModel> uploadImageAndData(
      {required File imageFile,
      required String name,
      required String description,
      required List<File> spaceImages}) async {
    try {
      List<MultipartFile> spaceImageFiles = await Future.wait(
          spaceImages.map((file) => MultipartFile.fromFile(file.path)));

      FormData formData = FormData.fromMap(
        {
          "space_cover_photo": await MultipartFile.fromFile(imageFile.path),
          "is_active": 0,
          "space_name": name,
          "space_description": description,
          "space_capacity": 20,
          "space_owner_id": 2,
          "latitude": "123",
          "longitude": "123",
          "category": "Burbershop1",
          "space_images": spaceImageFiles
        },
      );

      final requestData = await dio.post(
        '$base_url/create-main-space',
        data: formData,
        options: Options(sendTimeout: const Duration(seconds: 10)),
      );

      print('Server response: ${requestData.data}');
      if (requestData.data.containsKey('errors')) {
        final dataRetrieved =
            requestData.data['errors'] as Map<String, dynamic>;
        for (var key in dataRetrieved.keys) {
          final errors = dataRetrieved[key] as List<dynamic>;
          if (errors.isNotEmpty) {
            throw RequestException(errors[0]);
          }
        }
      }
      return SpaceModel.fromJson(requestData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        final requestMessage = e.response!.data['message'];

        throw RequestException(requestMessage);
      } else {
        //When device is offline
        String? errorMessage = e.message;
        int colonIndex = errorMessage!.indexOf(':');
        String extractedPart =
            "${errorMessage.substring(0, colonIndex).trim()} are you online?";
        throw NetworkException(extractedPart);
      }
    }
  }
}
