
import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

sktProgressLoader() {
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content:  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.all(10),
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Stack(
                children: [
                 

                  Center(
                      child: Container(
                          height: 120,
                          width: 120,
                          color: Colors.white,
                          child: const CircularProgressIndicator(
                            backgroundColor:Colors.white30,
                            strokeWidth: 3,
                          ))),
                  Center(
                    child: ZoomIn(
                      //  preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Loop,duration: Duration(milliseconds: 1100)),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: const SktText(text: "Loading ...")
                          // Image.asset(
                          //   // AppConfig.of(IBContext.context).appIcon,
                          //   LOADER,
                          //   // color: AppConfig.of( .context).appColor,
                          //   repeat: ImageRepeat.repeat,
                          //   fit: BoxFit.scaleDown, height: 105,
                          // )
                          
                          ),
                    ),
                  ),
                  Center(
                      child: Container(
                          height: 120,
                          width: 120,
                          color: Colors.grey.withAlpha(190),
                          child:const CircularProgressIndicator(
                            backgroundColor:Colors.white30,
                            strokeWidth: 3,
                          ))),

                  if (false)
                    // ignore: dead_code
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: ZoomIn(
                            // preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Loop,duration: Duration(seconds: 3)),
                            child:const SktText(text: "Loading ...")
                        //     Image.asset(
                        //   ABABIL_ICON,
                        //   fit: BoxFit.scaleDown,
                        //   height: 20,
                        //   // color: Colors.black,
                        // )
                        
                        ),
                      ),
                    ),
                ],
              ),
            )),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    useSafeArea: true,
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: null,
        child: alert);
    },
  );
}
