// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));
List<BookModel> bookListModelFromJson(String str) => List<BookModel>.from(json.decode(str).map((x) => BookModel.fromJson(x)));
String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
    BookModel({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.title,
        this.edition,
        this.author,
        this.available,
        this.copy,
    });

    int? createdAt;
    int? updatedAt;
    int? id;
    String? title;
    String? edition;
    String? author;
    int? available;
    int? copy;

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        title: json["title"],
        edition: json["edition"],
        author: json["author"],
        available: json["available"],
        copy: json["copy"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "title": title,
        "edition": edition,
        "author": author,
        "available": available,
        "copy": copy,
    };

factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        copy: json["copy"],
        available: json["available"],
        createdAt: json["issueDate"],
        edition: json["edition"],
        
       
      );
    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "author": author,
        "copy": copy,
        "available": available,
        "issueDate": createdAt,
        "edition":edition,
       
      };
}
