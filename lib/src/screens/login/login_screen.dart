import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/routes/routes_string.dart';
import 'package:cant_lib/src/utils/build_context.dart';
import 'package:cant_lib/src/widgets/skt_button.dart';
import 'package:cant_lib/src/widgets/skt_input_field.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double widthSize=0;
  @override
  void initState() {
    // TODO: implement initState

    
    super.initState();
    widthSize= 300;  //MediaQuery.of(context).size.width;
    
    
  }
  @override
  Widget build(BuildContext context) {
   TextEditingController _usernameController=TextEditingController();
   TextEditingController _passwordController=TextEditingController();

    
    widthSize=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: SktColors.background,
      body: Center(
        child: Container(
          width: widthSize>400?350:widthSize*0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

             const SktText(text:"Cantonment Library",),
              const SizedBox(height: 20,),
               SktInputField(label: "Username",
            textEditingController:_usernameController ,),
              const SizedBox(height: 10,),
            SktInputField(label: "Password",
            textEditingController:_passwordController ,
            valdationType: ValidationType.PASSWORD,),
              const SizedBox(height: 20,),

               SktButton(
                 onPress: (){

                   Navigator.pushNamed(context, Routes.HOME);
                 },

              text: "Login",
              )

            ],
          ),
        ),
      ),
      
    );
  }
}