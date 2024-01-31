import 'dart:convert';

ApiResponseModel apiResponseModelFromJson(String str) => ApiResponseModel.fromJson(json.decode(str));

String apiResponseModelToJson(ApiResponseModel data) => json.encode(data.toJson());

class ApiResponseModel {
    bool status;
    int? code;
    String? message;
    dynamic detail;

    ApiResponseModel({
        required this.status,
        required this.message,
        required this.code,
        required this.detail,
    });

    factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "detail": detail,
    };
}
