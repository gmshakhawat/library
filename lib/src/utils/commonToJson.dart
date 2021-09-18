// ignore_for_file: file_names

import 'dart:convert';

import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/models/common_response_model.dart';
import 'package:cant_lib/src/widgets/skt_alert_dialog.dart';

class CommonToJson {
  dynamic getString(String res, {isSuccessMsg = false, isErrorMsg = true}) {
    CommonResponseModel commonResponseModel = commonResponseModelFromJson(res);

    if (commonResponseModel.hasError!) {
      if (commonResponseModel.decentMessage == null) {
        
      sktAlertDialog('SOMETHING_WENTS_WRONG');
      } else if (isErrorMsg) {
        //  showToast(commonResponseModel.decentMessage,"Sorry");
        if (commonResponseModel.decentMessage!.isNotEmpty)
          sktAlertDialog(commonResponseModel.decentMessage);
      }
      // return false;
    } else {
      if (isSuccessMsg) {
        if (commonResponseModel.decentMessage == null) {
          sktAlertDialog('SOMETHING_WENTS_WRONG');
        } else {
          //  showToast(commonResponseModel.decentMessage,"Sorry");

          sktAlertDialog(commonResponseModel.decentMessage);
        }
      }
      if (commonResponseModel.content == null) {
        sktAlertDialog(commonResponseModel.decentMessage);
      }
    }

    var finalStringdata;

    // if (commonResponseModel.content != null) {

    print("=-=-=-=-=-=-=- C o n t e n t -=-=-=-=-=-=");

    try {
      finalStringdata =
          // json.decode(commonResponseModel.content);
          commonResponseModel.content!.replaceAll('\"', '"').toString();
      // print(json.decode(commonResponseModel.content!));
      print(finalStringdata);
    } catch (e) {
      print(e);
    }
    // }

    return finalStringdata;
  }

  bool isSuccess(String res) {
    CommonResponseModel commonResponseModel = commonResponseModelFromJson(res);
    if (commonResponseModel.hasError!) {
      sktAlertDialog(commonResponseModel.decentMessage);
      return false;
    } else {
      return true;
    }

    // String finalStringdata=commonResponseModel.content.replaceAll("\'", "").toString();
    // log("finalString:$finalStringdata");

    // return finalStringdata;
  }

   getDecentMsg(String res) {
    CommonResponseModel commonResponseModel = commonResponseModelFromJson(res);
    return commonResponseModel.decentMessage;

    // String finalStringdata=commonResponseModel.content.replaceAll("\'", "").toString();
    // log("finalString:$finalStringdata");

    // return finalStringdata;
  }

  bool isSuccessWIthAllAlert(String res, {isRedirect = true}) {
    CommonResponseModel commonResponseModel = commonResponseModelFromJson(res);

    if (commonResponseModel.hasError!) {
      sktAlertDialog(commonResponseModel.decentMessage);
      return false;
    } else {
      if (isRedirect) {
        sktAlertDialog(commonResponseModel.decentMessage);
      } else {
        sktAlertDialog(commonResponseModel.decentMessage);
      }

      //  BotToast.showText(text:commonResponseModel.decentMessage,contentColor: AppConfig.of(navigatorKey.currentContext!).appColor);

      //  ibNDAlertDialog(message: commonResponseModel.decentMessage,);

      // showAlertDialog(BackButtonBehavior.ignore,);

      // Navigator.push(
      //                       navigatorKey.currentContext!,
      //                       MaterialPageRoute(
      //                           builder: (_) => IBNDAleartDialog(message: commonResponseModel.decentMessage)));

      return true;
    }

    // String finalStringdata=commonResponseModel.content.replaceAll("\'", "").toString();
    // log("finalString:$finalStringdata");

    // return finalStringdata;
  }
}
