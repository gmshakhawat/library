// To parse this JSON data, do
//
//     final commonResponseModel = commonResponseModelFromJson(jsonString);

import 'dart:convert';

CommonResponseModel commonResponseModelFromJson(String str) => CommonResponseModel.fromJson(json.decode(str));

String commonResponseModelToJson(CommonResponseModel data) => json.encode(data.toJson());

class CommonResponseModel {
    CommonResponseModel({
        this.hasError,
        this.decentMessage,
        this.errorDetails,
        this.content,
    });

    bool? hasError;
    String? decentMessage;
    dynamic errorDetails;
    String? content;

    factory CommonResponseModel.fromJson(Map<String, dynamic> json) => CommonResponseModel(
        hasError: json["hasError"],
        decentMessage: json["decentMessage"],
        errorDetails: json["errorDetails"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "hasError": hasError,
        "decentMessage": decentMessage,
        "errorDetails": errorDetails,
        "content": content,
    };
}
