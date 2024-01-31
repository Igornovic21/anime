import 'dart:convert';

import 'package:anime/core/errors/exceptions.dart';
import 'package:anime/core/services/flutter_hive.dart';
import 'package:anime/models/api_response_model.dart';
import 'package:dio/dio.dart';

class DioService {
  static Dio dio = Dio();
  postData(
      {required String url, required data, required bool protected}) async {
    try {
      Response response = await dio.post(
        url,
        data: data,
        options: protected ? await setHeader() : null,
      );
      return apiResponseModelFromJson(json.encode(response.data));
    } catch (e) {
      if (e is DioException) processErrorResponse(e.response!);
    }
  }

  getData({required String url, required data, required bool protected}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        url,
        queryParameters: data,
        options: protected ? await setHeader() : null,
      );
      return apiResponseModelFromJson(json.encode(response.data));
    } catch (e) {
      if (e is DioException) processErrorResponse(e.response!);
    }
  }

  putData({required String url, required data, required bool protected}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.put(
        url,
        data: data,
        options: protected ? await setHeader() : null,
      );
      return apiResponseModelFromJson(json.encode(response.data));
    } catch (e) {
      if (e is DioException) processErrorResponse(e.response!);
    }
  }

  deleteData(
      {required String url,
      required Map<String, dynamic>? data,
      required bool protected}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.delete(
        url,
        queryParameters: data,
        options: protected ? await setHeader() : null,
      );
      return apiResponseModelFromJson(json.encode(response.data));
    } catch (e) {
      if (e is DioException) processErrorResponse(e.response!);
    }
  }

  static Future<Options> setHeader() async {
    final data = await HiveService.get(box: "user", key: "login_token");
    return Options(headers: {
      "authorization": "Token ${data["detail"]["token"]}",
    });
  }

  processErrorResponse(Response response) {
    ApiResponseModel apiResponse = apiResponseModelFromJson(
      json.encode(response.data),
    );
    switch (response.statusCode) {
      case 400:
        throw BadRequestExeption(
            message: apiResponse.message ??
                "Vous avez effectué une mauvaise requête",
            response: apiResponse);
      case 401:
        throw UnauthorizedExeption(
            message: apiResponse.message ?? "Accès refusé",
            response: apiResponse);
      case 403:
        throw UnauthorizedExeption(
            message: apiResponse.message ?? "Accès refusé",
            response: apiResponse);
      case 404:
        throw BadRequestExeption(
            message: apiResponse.message ?? "Demande introuvable",
            response: apiResponse);
      case 500:
        throw ServerException(
            message: "Une erreur serveur s'est produite",
            response: apiResponse);
      default:
        throw SocketException(
            message: "Problème de connexion au serveur", response: apiResponse);
    }
  }
}
