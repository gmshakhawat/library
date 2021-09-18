import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
sktAlertDialog(message,
    {cancelText,
    confirmText,
    Function? onConfirm,
    Function? onCancel,
    textAlign,
    isCancelable = true,
    confirmColor}) {
  return showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => WillPopScope(
            onWillPop: null,
          
            
            child: CupertinoAlertDialog(
                
                
                  // title: Text("e-KYC"),
                  title: 
                  // Icon(Icons.error,size: 40,),
                  
                 const SktText(
                    text: "Aleart!!!",
                    fsize: 20,
                    textAlign: TextAlign.center,
                  ),
                  content: SktText(
                    text: message.toString(),
                    fsize: 14,
                    textAlign: textAlign ?? TextAlign.center,
                  ),
                  actions: <Widget>[
                    if (isCancelable)
                      CupertinoDialogAction(
                          isDefaultAction: true,
                          isDestructiveAction: true,
                          textStyle: const TextStyle(fontSize: 20),
                          onPressed: () {
                            if (onCancel != null) {
                              onCancel();
                            } else {
                              Navigator.of(context).pop(false);
                            }
                          },
                          child: SktText(
                            text: cancelText != null ? cancelText : "OK",
                            color: SktColors.text2,
                            fontWeight: FontWeight.bold,
                          )),
                    if (onConfirm != null)
                      CupertinoDialogAction(
                          isDefaultAction: true,
                          isDestructiveAction: true,
                          textStyle: TextStyle(fontSize: 20),
                          onPressed: () {
                            onConfirm();
                          },
                          child: SktText(
                            text: confirmText != null ? confirmText : "OK",
                            
                            color: confirmColor ?? SktColors.text2,
                            fontWeight: FontWeight.bold,
                          )),
                  ]),
            
          ));
}
