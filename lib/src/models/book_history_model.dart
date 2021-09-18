// To parse this JSON data, do
//
//     final bookHistoryModel = bookHistoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:cant_lib/src/models/book_mode.dart';
import 'package:cant_lib/src/models/user_model.dart';

BookHistoryModel bookHistoryModelFromJson(String str) => BookHistoryModel.fromJson(json.decode(str));

String bookHistoryModelToJson(BookHistoryModel data) => json.encode(data.toJson());

class BookHistoryModel {
    BookHistoryModel({
        this.content,
      
        this.totalPages,
        this.totalElements,
        this.last,
        this.size,
        this.number,
       
        this.numberOfElements,
        this.first,
        this.empty,
    });

    List<Content>? content=[];
 
    int? totalPages;
    int? totalElements;
    bool? last;
    int? size;
    int? number;
    
    int? numberOfElements;
    bool? first;
    bool? empty;

    factory BookHistoryModel.fromJson(Map<String, dynamic> json) => BookHistoryModel(
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        size: json["size"],
        number: json["number"],
       
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
        
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "size": size,
        "number": number,
       
        "numberOfElements": numberOfElements,
        "first": first,
        "empty": empty,
    };
}

class Content {
    Content({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.copyAfter,
        this.user,
        this.book,
        this.returned,
    });

    int? createdAt;
    int? updatedAt;
    int? id;
    int? copyAfter;
    UserModel? user;
    BookModel? book;
    bool? returned;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        copyAfter: json["copyAfter"],
        user: UserModel.fromJson(json["user"]),
        book: BookModel.fromJson(json["book"]),
        returned: json["isReturned"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "copyAfter": copyAfter,
        "user": user!.toJson(),
        "book": book!.toJson(),
        "isReturned": returned,
    };
}


