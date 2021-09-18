// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

import 'package:cant_lib/src/models/book_mode.dart';

PageableBookModel bookPageableModelFromJson(String str) => PageableBookModel.fromJson(json.decode(str));

String bookPageableModelToJson(PageableBookModel data) => json.encode(data.toJson());

class PageableBookModel {
    PageableBookModel({
        this.content,
        this.totalPages,
        this.last,
        this.totalElements,
        this.numberOfElements,
        this.first,
        this.size,
        this.number,
        this.empty,
    });

    List<BookModel>? content=[];
    int? totalPages;
    bool? last;
    int? totalElements;
    int? numberOfElements;
    bool? first;
    int? size;
    int? number;
    bool? empty;

    factory PageableBookModel.fromJson(Map<String, dynamic> json) => PageableBookModel(
        content: List<BookModel>.from(json["content"].map((x) => BookModel.fromJson(x))),
       
        totalPages: json["totalPages"],
        last: json["last"],
        totalElements: json["totalElements"],
      
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
       
        "totalPages": totalPages,
        "last": last,
        "totalElements": totalElements,
       
        "numberOfElements": numberOfElements,
        "first": first,
        "size": size,
        "number": number,
        "empty": empty,
    };
}