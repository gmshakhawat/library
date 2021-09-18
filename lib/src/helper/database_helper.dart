
// // ignore_for_file: unnecessary_null_comparison

// import 'package:cant_lib/src/models/book_mode.dart';
// import 'package:sqflite_common/sqflite_dev.dart';
// import 'package:sqflite_common/sql.dart';
// import 'package:sqflite_common/sqlite_api.dart';
// import 'package:sqflite_common/utils/utils.dart';
// import 'package:sqflite_common/sqlite_api.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// // import 'package:sqflite/sqflite.dart';
// // import 'package:sqflite/sqlite_api.dart';

// const String tableName = 'books';
// const String columnId = 'id';
// const String columnAuthor = 'author';
// const String columnDate = 'date';
// const String columnCopy = 'copy';
// const String columnAvaiable = 'available';
// const String columnCategory = 'category';
// const String columnTitle = 'title';
// const String columnEdition = 'edition';
// const String columnIssueDate = 'issueDate';
// //final String columnColorIndex = 'gradientColorIndex';

// class BooksHelper {
//   static Database? _database;
//   static BooksHelper? _receiptHelper;

//   BooksHelper._createInstance();
//   factory BooksHelper() {
//     _receiptHelper ??= BooksHelper._createInstance();
//     return _receiptHelper!;
//   }

//   Future<Database> get database async {
//     _database ??= await initializeDatabase();
//     return _database!;
//   }

//   // Future<Database> initializeDatabase() async {
//   //   var dir = await getDatabasesPath();
//   //   var path = dir + "library.db";
//   //   // var factory = getIdbFactorySqflite(databaseFactory);

//   //   var database = await openDatabase(
//   //     path,
//   //     version: 2,
//   //     onCreate: (db, version) {
//   //       db.execute('''
//   //         create table $tableName ( 
//   //         $columnId integer primary key autoincrement, 
//   //         $columnTitle text not null,
//   //         $columnAuthor text not null,
//   //         $columnCopy integer,
//   //         $columnAvaiable integer,
//   //         $columnEdition text not null,
//   //         $columnIssueDate text not null)
//   //       ''');
//   //     },
//   //   );
//   //   return database;
//   // }


//  Future<Database> initializeDatabase() async {
//    sqfliteFfiInit();
//     var databaseFactory = databaseFactoryFfi;
//   _database = await databaseFactory.openDatabase(inMemoryDatabasePath);
// try{
//   var getData=await getBooksData();
// }catch(e){

//    await _database!.execute('''
// create table $tableName ( 
//   $columnId integer primary key autoincrement, 
//   $columnTitle text not null,
//   $columnAuthor text not null,
//   $columnCopy integer,
//   $columnAvaiable integer,
//   $columnEdition text not null,
//   $columnIssueDate text not null)
// ''');
// }


    
//     return _database!;
  

// }


//   //  Future<Database> initializeDatabase() async {
//   //   var dir = await getDatabasesPath();
//   //   var path = dir + "alarm.db";

//   //   var database = await openDatabase(
//   //     path,
//   //     version: 1,
//   //     onCreate: (db, version) {
//   //       db.execute('''
//   //         create table $tableName (
//   //         $columnId integer primary key autoincrement,
//   //         $columnTitle text not null,
//   //         $columnDateTime text not null,
//   //         $columnPending integer,
//   //         $columnColorIndex integer)
//   //       ''');
//   //     },
//   //   );
//   //   return database;

//   //  }

//    insertBook(BookModel bookModel) async {

//       var db=_database;
//      var res= await db!.insert('books', bookModel.toMap());

      

//     // var db = await this.database;
//     // var result = await db.insert(tableName, bookModel.toMap());
//     // print('result : $result');

//     return res;
//   }

//   Future<List<BookModel>> getBooksData() async {
//     List<BookModel> books = [];

//       var db =_database;
//      var result = await db!.query('books',);
// print(result);
//     // var db = await this.database;
//     // var result = await db.rawQuery('SELECT * FROM $tableName ORDER BY $columnId DESC');
//     for (var element in result) {
//       var bookInfo = BookModel.fromMap(element);
//       books.add(bookInfo);
//     }

//     return books;
//   }

//   Future<int> delete(int id) async {
//     var db = await this.database;
//     return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
//   }

//   Future<int> update(BookModel bookModel) async {
//     var db = await this.database;
//     return await db.update(tableName, bookModel.toMap(),
//         where: '$columnId = ?', whereArgs: [bookModel.id]);
//   }

//   Future close() async {
//     var db = await this.database;
//     db.close();
//   }
// }
