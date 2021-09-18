import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/services/api_exception.dart';
import 'package:cant_lib/src/widgets/ib_progress_loader.dart';
import 'package:cant_lib/src/widgets/skt_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum FileType { JPG, PNG }
const TIME_OUT =60;
enum BaseType { MAIN, IDTP, EKYC }

const String BASE_URL="http://localhost:8080/api/v1";

//////////////////////////////    Phone Verification     ////////////////////////////////////
class APIRequest {


  static getHeaders({isNew = false}) async {
   

    return {
      "Content-Type":"application/json"
    };
  }



  static Future<dynamic> post(url, body, {baseType = BaseType.MAIN}) async {
    sktProgressLoader();
    Map<String, String> headers = {
      //'content-type': 'application/json',
      // 'Authorization': "Bearer $token",
    };
   
    headers = await getHeaders();
    var responseJson;
    try {
      // final response =
      //     await http.post(CommonConstants.SERVER_IP + url, headers: headers, body: body,);

      //Testing...

      var uri = Uri.parse(BASE_URL + url);

      http.Request request = http.Request("POST", uri);
      request.headers.addAll(headers);
      if (body != "") {
        request.body = body;
      }
      print("ib Request Url: ${request.url}");
      print("ib Request: ${request.body}");
      print("ib Request Header: ${request.headers}");

      final response = await request.send().timeout(Duration(seconds: TIME_OUT),
          onTimeout: () {
        Navigator.of(navigatorKey.currentContext!).pop(false);
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == 401) {
        // var res = await getAccessToken(request);

        // if (res != null) {
        //   return _response(res);
        // }
      }

      //END ....

      print("StatusCode:>>>>>> ${response.statusCode}");

      responseJson = _response(response);
    } on SocketException {
      // noInternet();
      Navigator.of(navigatorKey.currentContext!).pop(false);

      // noInternet(onConfirm: () {
      //   Navigator.of(navigatorKey.currentContext!).pop(false);
      //   post(url, body, baseType: baseType);
      // });

      sktAlertDialog("Database Connection problem");

      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

/////////////////////////////////////////////////////////////////////////
//////////////////// P O S T   D O W N L O A D ///////////////////////
////////////////////////////////////////////////////////////
  ///
  ///

  static Future<dynamic> postDownload(url, body,
      {baseType = BaseType.MAIN}) async {

    sktProgressLoader();
    Map<String, String> headers = {
      //'content-type': 'application/json',
      // 'Authorization': "Bearer $token",
    };

    headers = await getHeaders();
    var responseJson;
    try {
      var uri = Uri.parse(BASE_URL + url);

      http.Request request = http.Request("POST", uri);
      request.headers.addAll(headers);
      if (body != "") {
        request.body = body;
      }

      print("ib Request: ${request.body}");
      print("ib Request Header: ${request.headers}");

      http.StreamedResponse response = await request
          .send()
          .timeout(Duration(seconds: TIME_OUT), onTimeout: () {
        Navigator.of(navigatorKey.currentContext!).pop(false);
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == 401) {
        // response = await getAccessToken(request);
      }

      if (response != null) {
        var res;
        if (response.statusCode == 200 || response.statusCode == 204) {
          print("Response>$response");
          Navigator.of(navigatorKey.currentContext!).pop(false);
          res = await http.Response.fromStream(response);
        } else {
          res = _response(response);
        }

        return res;
      }

      //END ....

      print("StatusCode:>>>>>> ${response.statusCode}");
    } on SocketException {
      // noInternet();
      Navigator.of(navigatorKey.currentContext!).pop(false);

           sktAlertDialog("Database Connection problem");


      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

///////////////////////////////////  P U T   M A S T E R    ////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////// D E L E T E  ////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////

  static Future<dynamic> delete(url, {baseType = BaseType.MAIN}) async {
   
   
    sktProgressLoader();
    Map<String, String> headers = {};

    var responseJson;
    try {
      // final response =
      //     await http.post(CommonConstants.SERVER_IP + url, headers: headers, body: body,);

      //Testing...

      var uri = Uri.parse(BASE_URL + url);

      http.Request request = http.Request("DELETE", uri);
      request.headers.addAll(headers);
      // request.body = body;

      // print("ib Request: ${request.body}");
      // print("ib Request Header: ${request.headers}");

      final response = await request.send().timeout(Duration(seconds: TIME_OUT),
          onTimeout: () {
        Navigator.of(navigatorKey.currentContext!).pop(false);
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == 401) {
        // var res = await getAccessToken(request);

        // if (res != null) {
        //   return _response(res);
        // }
      }

      //END ....

      print("KYC_Status:>>>>>> ${response.statusCode}");

      responseJson = _response(response);
    } on SocketException {
      // noInternet();
      Navigator.of(navigatorKey.currentContext!).pop(false);

           sktAlertDialog("Database Connection problem");


      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  //pUt

  static Future<dynamic> put(url, body, {baseType = BaseType.MAIN}) async {
   const String BASE_URL="localhost:8080/";
    
    sktProgressLoader();
    Map<String, String> headers = {
      //'content-type': 'application/json',
      // 'Authorization': "Bearer $token",
    };

   
    var responseJson;
    try {
      // final response =
      //     await http.post(COMMONCONSTANTS.SERVER_IP + url, headers: headers, body: body,);

      //Testing...

      var uri = Uri.parse(BASE_URL+ url);

      http.Request request = http.Request("PUT", uri);
      request.headers.addAll(headers);
      request.body = body;

      print("ib Request: ${request.body}");

      final response = await request.send().timeout(Duration(seconds: TIME_OUT),
          onTimeout: () {
        Navigator.of(navigatorKey.currentContext!).pop(false);
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      print("CallDOne");

      if (response.statusCode == 401) {
        // var res = await getAccessToken(request);

        // if (res != null) {
        //   return _response(res);
        // }
      }

      //END ....

      print("KYC_Status:>>>>>> ${response.statusCode}");

      responseJson = _response(response);
    } on SocketException {
      // noInternet();
      Navigator.of(navigatorKey.currentContext!).pop(false);
      sktAlertDialog("Database Connection problem");


      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  //"content-type: application/octet-stream"

  //// //////////////////////////   Upload Image    ////////////////////////////////////

  static Future<dynamic> uploadImage(body, eurl,
      {baseType = BaseType.MAIN}) async {
   
    sktProgressLoader();
    String url = "$BASE_URL$eurl";
  
    Map<String, String> headers = {
      //'content-type': 'application/json',
      // 'Authorization': "Bearer $token",
    };

   

    var response;

    try {
      //Uri uri = Uri.parse(COMMONCONSTANTS.SERVER_IP + eurl);
      var uri = Uri.parse(BASE_URL+ eurl);
      print("_____+++++++++_______ ResStatus:Checking $uri");
      http.Request request = http.Request("POST", uri);

      request.headers.addAll(headers);

      request.bodyBytes = body;
      print("_____+++++++++_______ ResStatus:Checking2 $uri");
      response = await request.send().timeout(Duration(seconds: TIME_OUT + 30),
          onTimeout: () {
        Navigator.of(navigatorKey.currentContext!).pop(false);
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      // if (response.statusCode == 401) {
      //   print("Need Token Refresh");
      //   var res = await getAccessToken(request);

      //   if (res != null) {
      //     return _response(res);
      //   }
      // }
    } on SocketException {
      Navigator.of(navigatorKey.currentContext!).pop(false);
          sktAlertDialog("Database Connection problem");

      throw FetchDataException('No Internet connection');
    } catch (e) {
      print("er_> $e");
      throw Exception('$e');
    }

    return _response(response);
  }

//// //////////////////////////   GET    ////////////////////////////////////

  static Future<dynamic> get(url, {baseType = BaseType.MAIN}) async {
   
    // String token = UserSecret.token.accessToken;
    Map<String, String> headers = {
      //'content-type': 'application/json',
      // 'Authorization': "Bearer $token",
    };

    // if (UserSecret.token != null) {
    // if (UserSecret.token.accessToken != null) {
    print("getting headers :> $headers");
    // token = UserSecret.token.accessToken;
    print(url);
    headers = await getHeaders();
    print("Headers Done :> $headers");
    // }
    // }
    sktProgressLoader();
    var response;
    try {
      //Try..

      var uri = Uri.parse(BASE_URL + url);
      print(uri);

      http.Request request =new http.Request("GET", uri);
      request.headers.addAll(headers);
      // request.body = body;

      response = await request.send().timeout(Duration(seconds: TIME_OUT),
          onTimeout: () {
        print("TIME OUT");
        Navigator.of(navigatorKey.currentContext!).pop(false);
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == 401) {
        // var res = await getAccessToken(request);

        // if (res != null) {
        //   print("res ok");
        //   return _response(res);
        // } else {
        //   print("Response Null  ->############");
        //   return null;
        // }
      }

      print("_____+++++++++_______ ResStatus: ${response.statusCode}");

      //END

      // var responseJson;
      // try {

      //   final response = await http.get(COMMONCONSTANTS.SERVER_IP + url, headers: headers);

      //   print("res-.> ${response.body}");
      //   responseJson = _response(response);

      //   //return responseJson;

    } on SocketException {
      Navigator.of(navigatorKey.currentContext!).pop(false);

            sktAlertDialog("Database Connection problem");

      throw FetchDataException('No Internet connection');
    }

    return _response(response);
  }

  sendServerRequest(http.Request request) async {
    var response = await request.send().timeout(Duration(seconds: TIME_OUT),
        onTimeout: () {
      print("TIME OUT");
      Navigator.of(navigatorKey.currentContext!).pop(false);
      sktAlertDialog("SOMETHING_WENTS_WRONG");
      throw TimeoutException('The connection has timed out, Please try again!');
    });

    return response;
  }



  static dynamic _response(var res) async {
    // print(response.body);

    http.Response response = await http.Response.fromStream(res);
  
    print("REs-COde-> ${response.statusCode}");
    // print("REponse-> ${json.decode(response.body)}");

    Navigator.of(navigatorKey.currentContext!).pop(false);
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;

      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;

      case 202:
        print("Res-204>");
        var responseJson = utf8.decode(response.bodyBytes).toString();
        print("Res_204: $responseJson");

        // print("KYC->${json.decode(responseJson)["content"]}");

        // if(json.decode(responseJson)["content"]!=null){
        //   return "Success";
        // }

        return "OK";

      case 204:
        var responseJson = utf8.decode(response.bodyBytes).toString();
        print(responseJson);
        // return responseJson;

        // print("KYC->${json.decode(responseJson)["content"]}");

        // if(json.decode(responseJson)["content"]!=null){
        //   return "Success";
        // }

        return "OK";
      case 400:
        sktAlertDialog(
            "${response.body.toString().replaceAll('"', "")} Bad Request");
        return "error ${response.body.toString()}";
        throw BadRequestException(
            response.body.toString() + response.statusCode.toString());
      case 401:
       
             sktAlertDialog("Database Connection problem");

        throw UnauthorisedException(response.body.toString() + "S-401");
      case 403:
        throw UnauthorisedException(response.body.toString() + "S-403");
      case 404:
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw UnauthorisedException(response.body.toString() + "S-404");

      case 405:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;

      case 500:
        print("Error-Code:500+${response.body.toString()}");
        //  var responseJson = utf8.decode(response.bodyBytes);
        //   print("Decoded REsponse >"+responseJson);
        //   return responseJson;
        sktAlertDialog("SOMETHING_WENTS_WRONG");
        throw UnauthorisedException(response.body.toString() + "S-500");

      case 496:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;

      case 497:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;
      case 498:
      case 499:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return "OTP";
      case 979:
        var responseJson = utf8.decode(response.bodyBytes).toString();
        print(responseJson);
        // if(responseJson.replaceAll('"', "")=="NID front face did not match with user photo."){
        //  // Navigator.p
        // }

        String status = responseJson.replaceAll('"', "");
        print("Message :$status");

        sktAlertDialog(status);
        return status;
      default:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;
    }
  }
}
